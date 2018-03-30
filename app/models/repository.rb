# frozen_string_literal: true

class Repository < ApplicationRecord
  has_many :dependencies, dependent: :destroy
  has_many :libraries, through: :dependencies

  validates :name, presence: true
  validates :url, presence: true
end
