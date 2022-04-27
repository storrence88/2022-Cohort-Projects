# frozen_string_literal: true

Rails.application.routes.draw do
  devise_for :users, path: '/api/v1', path_names: {
    sign_in: 'login',
    sign_out: 'logout',
    registration: 'signup'
  },
  controllers: {
    sessions: 'users/sessions',
    registrations: 'users/registrations'
  }
  mount QuoteApp::V1::Api, at: '/api', as: :api_root
  mount GrapeSwaggerRails::Engine, at: '/api-docs'
end
