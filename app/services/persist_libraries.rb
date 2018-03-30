# frozen_string_literal: true

class PersistLibraries < ApplicationService
  def call(library_names)
    Success(library_names)
      .bind(method(:persist_libraries))
  end

  private

  attr_reader :library_names

  def libraries
    @libraries ||= []
  end

  def persist_libraries(library_names)
    library_names.each do |library_name|
      persist_library(library_name)
    end
    Success(libraries)
  end

  def persist_library(library_name)
    library = Library.find_by(name: library_name)
    return libraries << library if library.present?
    libraries << create_library(library_name)
  end

  def create_library(library_name)
    library_data = LibraryInfoService.call(library_name).value
    Library.create!(
      name: library_name,
      url:  library_data["source_code_uri"],
      info: library_data["info"],
    )
  end
end
