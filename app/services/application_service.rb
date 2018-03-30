# frozen_string_literal: true

require "dry-monads"

class ApplicationService
  include Dry::Monads::Result::Mixin

  def self.call(*args)
    new(*args).call
  end
end
