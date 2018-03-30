# frozen_string_literal: true

source "https://rubygems.org"

git_source(:github) do |repo_name|
  repo_name = "#{repo_name}/#{repo_name}" unless repo_name.include?("/")
  "https://github.com/#{repo_name}.git"
end

gem "bootstrap-sass"
gem "dry-monads"
gem "haml-rails"
gem "jbuilder", "~> 2.5"
gem "pg", "~> 0.18"
gem "puma", "~> 3.7"
gem "pundit"
gem "rails", "~> 5.1.6"
gem "sass-rails", "~> 5.0"
gem "simple_form"
gem "uglifier", ">= 1.3.0"

# google omniauth
gem "omniauth"
gem "omniauth-google-oauth2"

# github api
gem "octokit"

# fetching libraries
gem "httparty"
gem "oj"

# crono jobs
gem "crono"
gem "daemons"

# background jobs
gem "redis-namespace", "~> 1.5.3"
gem "sidekiq"

# fake seed data
gem 'faker', :git => 'https://github.com/stympy/faker.git', :branch => 'master'

group :development do
  gem "better_errors"
  gem "listen", ">= 3.0.5", "< 3.2"
  gem "rubocop"
  gem "spring"
  gem "spring-watcher-listen", "~> 2.0.0"
  gem "web-console", ">= 3.3.0"
end

group :development, :test do
  gem "pry-rails"
  gem "pry-rescue"
end

group :test do
  gem "capybara", "~> 2.13"
  gem "database_cleaner"
  gem "factory_bot_rails"
  gem "ffaker"
  gem "launchy"
  gem "rspec-rails"
  gem "selenium-webdriver"
end
