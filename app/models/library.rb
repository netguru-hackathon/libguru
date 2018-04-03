# frozen_string_literal: true

class Library < ApplicationRecord
  has_many :dependencies, dependent: :destroy
  has_many :repositories, through: :dependencies
  belongs_to :category, optional: true

  validates :name, presence: true
end
