# frozen_string_literal: true

class Dependency < ApplicationRecord
  belongs_to :library, counter_cache: true
  belongs_to :repository

  validates :library, presence: true, uniqueness: { scope: :repository }
  validates :repository, presence: true
end
