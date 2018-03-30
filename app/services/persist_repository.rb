# frozen_string_literal: true

class PersistRepository < ApplicationService
  def call(repository_data)
    Success(Repository.find_or_create_by!(repository_data))
  end
end
