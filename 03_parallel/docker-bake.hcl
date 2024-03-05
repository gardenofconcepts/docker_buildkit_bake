group "default" {
  targets = ["python", "node"]
}

target "_common" {
  dockerfile = "Dockerfile"
  context = "."
  output = ["type=cacheonly"]
}

target "base" {
  inherits = ["_common"]
  target = "base"
}

target "python" {
  inherits = ["_common"]
  target = "python"
}

target "node" {
  inherits = ["_common"]
  target = "node"
}
