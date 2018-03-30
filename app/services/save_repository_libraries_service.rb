# frozen_string_literal: true

class SaveRepositoryLibrariesService < ApplicationService
  def call(repository_name, gem_names)
    FindOrCreateRepository.call
      .bind { |repository| ClearDependencies.call(repository, gem_names) }
      .bind { |repository|  }
  end
end
