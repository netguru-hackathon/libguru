# frozen_string_literal: true

class SaveLibraryToDatabase
  def initialize(repo_name, library_name)
    @repo_name =    repo_name
    @library_name = library_name
  end

  def call
    return if repo.nil?
    if library.present?
      repo.libraries << library
    else
      library_info = LibraryInfoService.call(library_name)
      Library.create(
        name: library_name,
        url:  library_info["source_code_uri"],
        info: library_info["info"],
        repositories: [repo],
      )
    end
  end

  private

  attr_reader :library_name, :repo_name

  def repo
    Repository.find_by(name: repo_name)
  end

  def library
    Library.find_by(name: library_name)
  end
end
