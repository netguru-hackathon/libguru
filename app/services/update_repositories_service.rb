# frozen_string_literal: true

class UpdateRepositoriesService < ApplicationService
  def call
    FetchRepositories.call
      .bind(method(:update_repositories))
  end

  private

  def update_repositories(repository_names)
    repository_names.each do |repository_name|
      CallServiceObjectJob.perform_later(UpdateRepository, repository_name)
    end
    Success(nil)
  end
end
