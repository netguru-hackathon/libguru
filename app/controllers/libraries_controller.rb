# frozen_string_literal: true

class LibrariesController < ApplicationController
  def index
    @ranking = Library.order(dependencies_count: :desc, name: :asc)
  end

  def show
    @library = Library.find(params[:id])
    @repositories_with_library = @library.repositories
  end
end
