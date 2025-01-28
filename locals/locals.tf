locals {
  domain_name = "nhari.online"
  zone_id = "Z05871131JCJ34SEUMLUJ"
  #count.index doesn't work in locals
  instance_type = var.environment == "prod" ? "t3.medium" : "t3.micro"
}
