# frozen_string_literal: true

module QuoteApp
  module V1
    module Helpers
      module AuthenticationHelper
        # Returns the current_user object
        #
        # @return [User] currently logged in user
        def current_user
          @current_user ||= User.find_by(jti: auth_token) if auth_token
        end

        # Auth token sent as header or param
        #
        # @return [String] auth token
        def auth_token
          # @auth_token ||= env['HTTP_AUTHORIZATION'] || params[:token] || params[:api_key]
          @auth_token ||= Warden::JWTAuth::TokenDecoder.new.call(request.headers['Authorization'].gsub('Bearer ', ''))
          @auth_token&.dig('jti')
        end

        # Tries to login in a user and raises an error
        # if unable to authenticate from auth token
        #
        # @return [Error] if current user not available
        def authenticate!
          error!('Unauthorized request. Please login.', 401) unless current_user
        end
      end
    end
  end
end
