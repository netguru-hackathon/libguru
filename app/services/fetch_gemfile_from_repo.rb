# frozen_string_literal: true

class FetchGemfileFromRepo
  require "base64"

  def initialize(repo_name)
    @repo_name = repo_name
  end

  def call
    gemfile_content = Octokit.client.contents("netguru/#{@repo_name}", path: "Gemfile").content
    decode gemfile_content
  end

  private

  def decode(string)
    Base64.decode64(string)
  end
end
