variable "image_id" {
  type = string
  description = "O id da imagem AMI"
  default = "ami-005f9685cb30f234b"

  validation {
    condition     = length(var.image_id) > 4 && substr(var.image_id, 0, 4) == "ami-"
    error_message = "A imagem precisa ser uma imagem AMI válida. " 
  }
}

variable "instance_type" {
  type    = string
  default = "t2.micro"
}

variable "aws_subnet_id" {
  type = list(string)
}

variable "aws_sg_id" {
  type = string
}
