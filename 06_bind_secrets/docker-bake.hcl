group "default" {
  targets = ["build"]
}

target "build" {
  dockerfile = "Dockerfile"
  context = "."
  ssh = [
    "default"
  ]
  secret = [
    "type=env,id=MY_TOKEN",
  ]
  output = ["type=cacheonly"]
}
