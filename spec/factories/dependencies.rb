# frozen_string_literal: true

FactoryBot.define do
  factory :dependency do
    association :library, factory: :library
    association :repository, factory: :repository
  end
end
