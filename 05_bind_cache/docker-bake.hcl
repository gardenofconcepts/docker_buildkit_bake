group "default" {
  targets = ["build"]
}

target "build" {
  dockerfile = "Dockerfile"
  context = "."
  output = ["type=cacheonly"]
}
