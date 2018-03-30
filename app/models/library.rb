# frozen_string_literal: true

class Library < ApplicationRecord
  has_many :dependencies

  validates :name, presence: true
end
