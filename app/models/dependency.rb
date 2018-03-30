class Dependency < ApplicationRecord
  belongs_to :library
  belongs_to :repository
end
