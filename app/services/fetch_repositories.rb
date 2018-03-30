# frozen_string_literal: true

class FetchRepositories < ApplicationService
  def call
    Success(Octokit.org_repos("netguru").map(&:full_name))
  rescue Octokit::NotFound => e
    Failure(e)
  end
end
