group "default" {
  targets = ["build"]
}

variable "DIST_DIR" {
  default = "./dist"
}

target "_common" {
  context    = "."
  dockerfile = "Dockerfile"
  output     = ["type=cacheonly"]
}

target "build" {
  inherits = ["_common"]
  target   = "build"
}

target "dist" {
  inherits = ["_common"]
  target   = "dist"
  output   = ["${DIST_DIR}"]
}
