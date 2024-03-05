group "default" {
  targets = ["app"]
}

target "_common" {
  context = "."
  output  = ["type=cacheonly"]
}

target "base" {
  inherits   = ["_common"]
  dockerfile = "Base.Dockerfile"
  contexts   = {
    my_alpine = "docker-image://alpine:latest"
  }
}

target "app" {
  inherits   = ["base"]
  dockerfile = "App.Dockerfile"
  contexts   = {
    base = "target:base"
  }
}
