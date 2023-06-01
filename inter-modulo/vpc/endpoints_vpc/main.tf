resource "aws_security_group" "endpoints" {
  count       = length(var.interface_endpoints.services) > 0 ? 1 : 0
  name        = "endpoints-sg-${var.vpc_name}"
  description = "Permite acesso a instacia via SSM"
  vpc_id      = var.vpc_id

  ingress {
    description = "Permite o trafego para https"
    from_port   = 443
    to_port     = 443
    protocol    = "6"
    cidr_blocks = [var.vpc_cidr]
  }

  egress {
    description = "Permite todo o trafego de saida"
    from_port   = 0
    to_port     = 0
    protocol    = "-1"
    cidr_blocks = ["0.0.0.0/0"]
  }

  tags = merge(
    { "Name" = "sgp-endpoints" },
    var.tags
)

  lifecycle {
    # Se for necessário alterar o nome do SG ou prefixo, crie um novo antes de destruir o antigo.
    create_before_destroy = true
  }
}

#data "template_file" "teste" {
#  template = "${file("policy.json")}"
#}

#resource "aws_iam_policy" "teste" {
  # outras policies

#  policy = "${data.template_file.teste.rendered}" 
#}

resource "aws_vpc_endpoint" "interface_endpoints" {
  for_each            = toset(var.interface_endpoints.services)
  vpc_id              = var.vpc_id
  service_name        = "com.amazonaws.${local.region}.${each.value}"
  vpc_endpoint_type   = "Interface"
  security_group_ids  = [aws_security_group.endpoints[0].id]
  subnet_ids          = var.interface_endpoints.subnet_ids
  private_dns_enabled = each.value == "ssm" ? true : false
  policy              = each.value == "ssm" ? jsonencode({
    "Version" : "2012-10-17",
    "Statement" : [
      {
        "Sid" : "AllowAll",
        "Effect" : "Allow",
        "Principal" : {
          "AWS" : "*"
         },
         "Action" : [
           "ssm:List*",
           "ssm:Get*",
           "ssm:UpdateInstanceInformation",
         ],
         "Resource" : "*"
       }
     ]
   }) : ""


  tags = merge(
    { "Name" = "${var.vpc_name}-${each.value}-endpoint" },
    var.tags    
  ) 
  timeouts {
    create = "10m"
    update = "10m"
    delete = "10m"
  }
}

#resource "aws_vpc_endpoint_policy" "teste" {
#  vpc_endpoint_id = aws_vpc_endpoint.interface_endpoints[each.key] #var.aws_vpc_endpoints.interface_ids
#  policy  =  jsonencode({
#    "Version" : "2012-10-17",
#    "Statement" : [
#      {
#        "Sid" : "AllowAll",
#        "Effect" : "Allow",
#        "Principal" : {
#          "AWS" : "*"
#         },
#         "Action" : [
#           "ssm:List*",
#           "ssm:Get*",
#           "ssm:UpdateInstanceInformation",
#         ],
#         "Resource" : "*"
#       }
#     ]
#   }) 
#}
