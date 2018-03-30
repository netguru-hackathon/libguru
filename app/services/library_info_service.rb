# frozen_string_literal: true

require "oj"

class LibraryInfoService < ApplicationService
  def initialize(library)
    @library = library
  end

  def call
    fetch_library_data
      .bind(method(:load_json))
  end

  private

  attr_reader :library

  def fetch_library_data
    Success(HTTParty.get("http://rubygems.org/api/v1/gems/#{library}.json"))
  rescue => e
    Failure(e)
  end

  def load_json(response)
    Success(Oj.load(response.to_s))
  rescue => e
    Failure(e)
  end
end
