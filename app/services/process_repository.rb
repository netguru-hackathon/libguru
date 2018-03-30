# frozen_string_literal: true

class ProcessRepository < ApplicationService
  def call(repository_name)
    Success(repository_name)
      .bind(:persist_repository)
      .bind(:fetch_gemfile_from_repo)
      .bind(:parse_gemfile)
      .bind(:persist_libraries)
      .bind(:persist_dependencies)
  end

  private

  attr_reader :repository

  def persist_repository(repository_name)
    PersistRepository.call(repository_name)
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
