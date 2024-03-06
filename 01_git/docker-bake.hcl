group "default" {
  targets = ["build"]
}

variable "IMAGE_NAME" {
  default = "meetup/git"
}

variable "IMAGE_TAG" {
  default = "latest"
}

target "build" {
  dockerfile = "Dockerfile"
  context    = "."
  tags       = [
    "${IMAGE_NAME}:${IMAGE_TAG}",
  ]
  output = ["type=docker"]
}
