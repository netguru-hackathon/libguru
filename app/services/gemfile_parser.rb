# frozen_string_literal: true

class GemfileParser < ApplicationService
  def initialize(lockfile)
    @lockfile = lockfile
  end

  def call
    Success(read_dependencies)
  end

  private

  attr_reader :lockfile

  def read_dependencies
    Bundler::LockfileParser.new(lockfile).dependencies.keys
  end
end
