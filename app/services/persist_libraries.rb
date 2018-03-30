# frozen_string_literal: true

class PersistLibraries < ApplicationService
  def call(_gem_names)
    raise NotImplementedError
  end
end
