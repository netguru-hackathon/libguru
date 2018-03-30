# frozen_string_literal: true

class Library < ApplicationRecord
  has_many :dependencies, dependent: :destroy
  has many :repositories, through: :dependencies

  validates :name, presence: true
end
