# frozen_string_literal: true

class FetchGemfileFromRepo < ApplicationService
  require "base64"

  def call(repo_name)
    Success(repo_name)
      .bind(method(:fetch_encoded_content))
      .bind(method(:decode))
  end

  private

  def fetch_encoded_content(repo_name)
    Success(Octokit.client.contents(repo_name, path: "Gemfile.lock").content)
  rescue Octokit::NotFound => e
    Failure(e)
  end

  def decode(encoded_content)
    Success(Base64.decode64(encoded_content))
  end
end
