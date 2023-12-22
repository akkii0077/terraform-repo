terraform {
  backend "gcs" {
    bucket      = "tf-state-uaedataloop"
    prefix      = "tfstate"
    credentials = "uaedataloop-service-account.json"
  }
}
