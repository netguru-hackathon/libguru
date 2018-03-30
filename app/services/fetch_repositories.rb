# frozen_string_literal: true

class FetchRepositories < ApplicationService
  def call
    Success(
      Octokit.org_repos("netguru")
        .map { |repo| { name: repo.full_name, url: repo.html_url } }
    )
  rescue Octokit::NotFound => e
    Failure(e)
  end
end
