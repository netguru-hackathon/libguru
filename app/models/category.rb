# frozen_string_literal: true

class Category < ApplicationRecord
  has_many :libraries

  validates :name, presence: true
end
