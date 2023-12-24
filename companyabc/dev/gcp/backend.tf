terraform {
  backend "gcs" {
    bucket      = "tf-state-uaedataloop-dev"
    prefix      = "tfstate"
    credentials = "uaedataloop-service-account.json"
  }
}
