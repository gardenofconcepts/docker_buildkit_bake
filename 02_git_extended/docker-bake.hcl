group "default" {
  targets = ["build"]
}

variable "IMAGE_NAME" {
  default = "meetup/git"
}

variable "IMAGE_TAG" {
  default = "2.0"
}

target "build" {
  dockerfile = "Dockerfile"
  context = "."
  tags = [
    "${IMAGE_NAME}:${IMAGE_TAG}",
  ]
  args = {
    "ALPINE_VERSION" = "3.19"
  }
  output = ["type=cacheonly"]
}
