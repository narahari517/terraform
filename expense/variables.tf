variable "instance_name" {
    type = list(string)
    default = ["mysql", "backend", "frontend"]
}

variable "common_tags" {
    type = map
    default = {
        Project = "expense"
        Environment = "dev"
        Terraform = "true"
    }
}

variable "zone_id" {
    default = "Z05871131JCJ34SEUMLUJ"
}

variable "domain_name" {
    default = "nhari.online"
}