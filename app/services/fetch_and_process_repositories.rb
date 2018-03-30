# frozen_string_literal: true

class FetchAndProcessRepositories < ApplicationService
  def call
    FetchRepositories.call
      .bind(method(:process_repositories))
  end

  private

  def process_repositories(repository_data_array)
    repository_data_array.each { |repository_data| schedule_job(repository_data) }
    Success(nil)
  end

  def schedule_job(repository_data)
    CallServiceObjectJob.perform_later(ProcessRepository, repository_data)
  end
end
