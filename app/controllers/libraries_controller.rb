# frozen_string_literal: true

class LibrariesController < ApplicationController
  def index
    @ranking = Library.order(dependencies_count: :desc, name: :asc)
  end

  def show
    @library = Library.find(params[:id])
    @repositories_with_library = @library.repositories
  end

  def edit
    @library = Library.find(params[:id])
  end

  def update
    library = Library.find(params[:id])
    redirect_to categories_path if library.update!(library_params)
  end

  private

  def library_params
    params.require(:library).permit(:category_id)
  end
end
