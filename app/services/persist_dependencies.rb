# frozen_string_literal: true

class PersistDependencies < ApplicationService
  def call(libraries, repository)
    persist_dependencies(libraries, repository)
  end

  private

  def persist_dependencies(libraries, repository)
    dependencies = []
    libraries.each do |library|
      dependency = find_or_create_dependency(library, repository)
      dependencies << dependency
    end
    Success(dependencies)
  end

  def find_or_create_dependency(library, repository)
    Dependency.find_or_create_by!(
      library_id: library.id,
      repository_id: repository.id
    )
  end
end
