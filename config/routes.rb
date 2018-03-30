# frozen_string_literal: true

Rails.application.routes.draw do
  resources :libraries, only: [:index, :show]

  root to: "libraries#index"
  get "/auth/:provider/callback" => "sessions#create"
  get "/signin" => "sessions#new", as: :signin
  get "/signout" => "sessions#destroy", as: :signout
  get "/auth/failure" => "sessions#failure"

  require "sidekiq/web"
  mount Sidekiq::Web => "/sidekiq"
end
