# frozen_string_literal: true

class LibrariesController < ApplicationController
  def index
    @ranking = Library.order(dependencies_count: :desc, name: :asc)
  end
end
