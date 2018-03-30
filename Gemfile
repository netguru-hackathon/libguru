# frozen_string_literal: true

source "https://rubygems.org"

git_source(:github) do |repo_name|
  repo_name = "#{repo_name}/#{repo_name}" unless repo_name.include?("/")
  "https://github.com/#{repo_name}.git"
end

gem "bootstrap-sass"
gem "haml-rails"
gem "jbuilder", "~> 2.5"
gem "pg", "~> 0.18"
gem "puma", "~> 3.7"
gem "pundit"
gem "rails", "~> 5.1.6"
gem "sass-rails", "~> 5.0"
gem "simple_form"
gem "uglifier", ">= 1.3.0"

gem "omniauth"
gem "omniauth-google-oauth2"

gem "octokit"

gem "httparty"
gem "oj"

group :development do
  gem "better_errors"
  gem "listen", ">= 3.0.5", "< 3.2"
  gem "spring"
  gem "spring-watcher-listen", "~> 2.0.0"
  gem "web-console", ">= 3.3.0"
end

group :development do
  gem "pry-rails"
  gem "pry-rescue"
  gem "rubocop"
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
