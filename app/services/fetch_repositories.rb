# frozen_string_literal: true

class FetchRepositories
  def call
    project_names
  end

  private

  def project_names
    Octokit.org_repos("netguru").map(&:full_name)
  end
end
