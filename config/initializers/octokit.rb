# frozen_string_literal: true

Octokit.configure do |c|
  c.access_token = Rails.application.secrets.github_access_token
  c.auto_paginate = true
end
