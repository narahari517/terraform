variable "instances" {
    type = map
    default = {
        mysql = "t3.small"
        backend = "t3.micro"
        frontend = "t3.micro"
    }
}

variable "zone_id" {
    default = "Z05871131JCJ34SEUMLUJ"
}

variable "domain_name" {
    default = "nhari.online"
}