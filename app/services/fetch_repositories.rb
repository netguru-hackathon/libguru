# frozen_string_literal: true

class FetchRepositories
  def call
    project_names.compact
  end

  private

  def project_names
    Octokit.org_repos("netguru").map do |repo|
      repo.full_name if ruby_project?(repo)
    end
  end

  def ruby_project?(repo)
    repo.language == "Ruby"
  end
end
