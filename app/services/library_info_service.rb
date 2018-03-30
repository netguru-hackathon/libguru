# frozen_string_literal: true

require "oj"

class LibraryInfoService < ApplicationService
  def call(library)
    Success(library)
    .bind(method(:fetch_library_data))
      .bind(method(:load_json))
  end

  private

  def fetch_library_data(library)
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
