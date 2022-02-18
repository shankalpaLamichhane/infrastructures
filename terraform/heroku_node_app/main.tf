provider "heroku" {}

resource "heroku_app" "example" {
  name   = "learn-terraform-heroku-1"
  region = "us"
}

resource "heroku_addon" "postgres" {
  app  = heroku_app.example.id
  plan = "heroku-postgresql:hobby-dev"
}

resource "heroku_build" "example" {
  app = heroku_app.example.id

  source {
    path = "./app"
  }
}

