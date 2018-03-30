# frozen_string_literal: true

class ProcessRepository < ApplicationService
  def call(repository_name)
    PersistRepository.call(repository_name)
      .bind do |repository|
        @repository = repository
        FetchGemfileFromRepo.call(repository.name)
      end
      .bind { |gemfile_content| GemfileParser.call(gemfile_content) }
      .bind { |gem_names| PersistLibraries.call(gem_names) }
      .bind { |libraries| PersistDependencies.call(libraries, repository) }
  end

  private

  attr_reader :repository
end
