# frozen_string_literal: true

class FetchAndProcessRepositories < ApplicationService
  def call
    FetchRepositories.call
      .bind(method(:process_repositories))
  end

  private

  def process_repositories(repository_names)
    repository_names.each { |repository_name| schedule_job(repository_name) }
    Success(nil)
  end

  def schedule_job(repository_name)
    CallServiceObjectJob.perform_later(ProcessRepository, repository_name)
  end
end
