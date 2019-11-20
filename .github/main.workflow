workflow "Run Webpagetest" {
  on = "push"
  resolves = ["GenerateSourcecred"]
}

action "GenerateSourcecred" {
  uses = "./"
  secrets = [
    "GITHUB_TOKEN",
  ]
  env = {
    TEST_VARIABLE = "hellohello"
  }
}
