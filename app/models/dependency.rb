class Dependency < ApplicationRecord
  belongs_to :library
  belongs_to :repository

  validates :library, presence: true, uniqueness: { scope: :repository }
  validates :repository, presence: true
end
