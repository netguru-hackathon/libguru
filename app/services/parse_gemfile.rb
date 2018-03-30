# frozen_string_literal: true

class ParseGemfile < ApplicationService
  def call(lockfile)
    Success(lockfile)
      .bind(method(:read_dependencies))
  end

  private

  def read_dependencies(lockfile)
    Success(Bundler::LockfileParser.new(lockfile).dependencies.keys)
  end
end
