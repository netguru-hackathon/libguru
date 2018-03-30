# frozen_string_literal: true

class PersistRepository < ApplicationService
  def call(_repository_name)
    raise NotImplementedError
  end
end
