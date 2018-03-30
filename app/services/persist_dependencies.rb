# frozen_string_literal: true

class PersistDependencies < ApplicationService
  def call(_libraries, _repository)
    raise NotImplementedError
  end
end
