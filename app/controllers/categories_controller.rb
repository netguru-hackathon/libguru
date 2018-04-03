# frozen_string_literal: true

class CategoriesController < ApplicationController
  def index
    @categories = Category.order(:name).includes(:libraries)
    @uncategorised_libs = Library.where(category_id: nil)
  end

  def new
    session[:return_to] ||= request.referer
    @category = Category.new
  end

  def create
    redirect_to session.delete(:return_to) if Category.create!(category_params)
  end

  private

  def category_params
    params.require(:category).permit(:name)
  end
end
