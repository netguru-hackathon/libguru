# frozen_string_literal: true

class FetchGemfileFromRepo
  require "base64"

  def initialize(repo_name)
    @repo_name = repo_name
  end

  def call
    begin
      gemfile_content = Octokit.client.contents(repo_name, path: "Gemfile").content
      decode gemfile_content
    rescue Octokit::NotFound => error
      false
    end
  end

  private

  attr_reader :repo_name

  def decode(string)
    Base64.decode64(string)
  end
end
