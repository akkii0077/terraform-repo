terraform {
  backend "gcs" {
    bucket      = "tf-state-uaedataloop-prod"
    prefix      = "tfstate"
    credentials = "uaedataloop-service-account.json"
  }
}
