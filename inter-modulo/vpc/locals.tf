locals {
  vpc_name = "${var.prefix_name}-teste-${local.region}"
#  vpc_name = "${var.prefix_name}-${var.environment}-${local.region}"
  region   = data.aws_region.current.name
  az_set = {
    us-east-1 = [
      "us-east-1a",
      "us-east-1b",
      "us-east-1c",
#      "us-east-1d",
#      "us-east-1f"
    ]
    sa-east-1 = [
      "sa-east-1a",
      "sa-east-1b",
      "sa-east-1c"
    ]
    us-east-2 = [
      "us-east-2a",
      "us-east-2b",
      "us-east-2c"]
  }
  az = local.az_set[local.region]
  newbits = length(local.az) == 3 ? 2 : 3
  netnum  = {for i, az in local.az: az => i+1}
}
