# frozen_string_literal: true

class FetchGemfileFromRepo < ApplicationService
  require "base64"

  def initialize(repo_name)
    @repo_name = repo_name
  end

  def call
    fetch_encoded_content(repo_name)
      .bind(method(:decode))
  end

  private

  attr_reader :repo_name

  def fetch_encoded_content(repo_name)
    Success(Octokit.client.contents(repo_name, path: "Gemfile").content)
  rescue Octokit::NotFound => e
    Failure(e)
  end

  def decode(encoded_content)
    Success(Base64.decode64(encoded_content))
  end
end
