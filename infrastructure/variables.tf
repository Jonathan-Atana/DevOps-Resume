variable "container_name" {
  description = "The name of the container"
  type        = string
  default     = "nginx"
}

variable "container_image" {
  description = "The Docker image to deploy."
  type        = string
  default     = "nginx:latest"
}

variable "env" {
  description = "Environment"
  type        = string
  default     = "dev"
}

variable "bucket_name" {
  description = "Name of the s3 bucket"
  type = string
  sensitive = true
}