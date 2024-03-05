group "default" {
  targets = ["app"]
}

variable "REGISTRY_PREFIX" {
  default = "registry.gitlab.com/gardenofconcepts/buildkit/cli"
}

variable "IMAGE_VERSION" {
  default = "latest"
}

variable "IMAGE_BASE" {
  default = "${REGISTRY_PREFIX}/base:${IMAGE_VERSION}"
}

variable "IMAGE_SETUP" {
  default = "${REGISTRY_PREFIX}/setup:${IMAGE_VERSION}"
}

variable "IMAGE_APP" {
  default = "${REGISTRY_PREFIX}:${IMAGE_VERSION}"
}

target "_common" {
  context    = "."
  dockerfile = "Dockerfile"
  ssh        = [
    "default"
  ]
  output   = ["type=cacheonly"]
  contexts = {
    app_src = "../06_bind_secrets"
  }
}

target "base" {
  inherits = ["_common"]
  cache-to = [
    "type=registry,ref=${IMAGE_BASE},mode=max"
  ]
  cache-from = [
    "type=registry,ref=${IMAGE_BASE}"
  ]
  target = "base"
}

target "setup" {
  inherits = ["base"]
  cache-to = [
    "type=registry,ref=${IMAGE_SETUP},mode=max"
  ]
  cache-from = [
    "type=registry,ref=${IMAGE_SETUP}"
  ]
  target = "setup"
}

target "app" {
  inherits = ["setup"]
  tags     = [
    "${IMAGE_APP}"
  ]
  cache-to = [
    "type=registry,ref=${IMAGE_APP},mode=max"
  ]
  cache-from = [
    "type=registry,ref=${IMAGE_APP}"
  ]
  target = "app"
  output = ["type=image,name=${IMAGE_APP}"]
}
