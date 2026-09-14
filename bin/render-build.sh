#!/usr/bin/env bash
# Exit on error
set -o errexit

bundle install

bundle exec rails db:migrate
# Optional: Include migrations here if you are using Render's Free Plan
# bundle exec rails db:migrate 
bundle exec rails db:seed
