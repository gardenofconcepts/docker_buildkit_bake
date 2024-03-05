group "default" {
  targets = ["stage2"]
}

target "_common" {
  dockerfile = "Dockerfile"
  context = "."
  output = ["type=cacheonly"]
}

target "stage1" {
  inherits = ["_common"]
  target = "stage1"
}

target "stage2" {
  inherits = ["_common"]
  target = "stage2"
}
