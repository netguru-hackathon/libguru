# frozen_string_literal: true

class ProcessRepository < ApplicationService
  def call(repository_data)
    Success(repository_data)
      .bind(method(:persist_repository))
      .bind(method(:fetch_gemfile_from_repo))
      .bind(method(:parse_gemfile))
      .bind(method(:persist_libraries))
      .bind(method(:persist_dependencies))
  end

  private

  attr_reader :repository

  def persist_repository(repository_data)
    PersistRepository.call(repository_data)
  end

  def fetch_gemfile_from_repo(repository)
    @repository = repository
    FetchGemfileFromRepo.call(repository.name)
  end

  def parse_gemfile(gemfile_content)
    ParseGemfile.call(gemfile_content)
  end

  def persist_libraries(gem_names)
    PersistLibraries.call(gem_names)
  end

  def persist_dependencies(libraries)
    PersistDependencies.call(libraries, repository)
  end
end
