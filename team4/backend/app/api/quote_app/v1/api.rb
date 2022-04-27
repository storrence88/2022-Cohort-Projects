# frozen_string_literal: true

module QuoteApp
  module V1
    class Api < Grape::API
      version 'v1', using: :path
      format :json
      insert_after Grape::Middleware::Formatter, Grape::Middleware::Logger

      before do
        header['Access-Control-Allow-Origin'] = '*'
        header['Access-Control-Request-Method'] = '*'
      end

      rescue_from ActiveRecord::RecordNotFound do |e|
        error!(e.message, 404)
      end

      rescue_from ActiveRecord::RecordInvalid do |e|
        error!(e.message, 400)
      end

      rescue_from Grape::Exceptions::ValidationErrors do |e|
        error_response message: e.message, status: 400
      end

      mount QuoteApp::V1::Unauthenticated
      mount QuoteApp::V1::Authenticated

      add_swagger_documentation api_version: 'v1',
                                mount_path: '/api-docs',
                                hide_format: true,
                                info: {
                                  title: 'QuoteApp API v1.0',
                                  description: 'Backend API for QuoteApp'
                                }
    end
  end
end
