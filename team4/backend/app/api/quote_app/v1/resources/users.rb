# frozen_string_literal: true

module QuoteApp
  module V1
    module Resources
      class Users < BaseApi
        resources :users do
          desc 'Get current user'
          get :current_user do
            UserSerializer.new(current_user).serializable_hash
          end
        end
      end
    end
  end
end
