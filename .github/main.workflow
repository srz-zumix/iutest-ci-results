workflow "Main workflow" {
  on = "push"
  resolves = ["danger"]
}

action "danger" {
  uses = "duck8823/actions/danger@master"
  secrets = ["GITHUB_TOKEN"]
}
