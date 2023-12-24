terraform {
  backend "gcs" {
    bucket      = "tf-state-company-xyz"
    prefix      = "tfstate"
    credentials = "uae-xyz-07f75acbacff.json"
  }
}
