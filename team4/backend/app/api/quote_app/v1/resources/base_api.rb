# frozen_string_literal: true

module QuoteApp
  module V1
    module Resources
      class BaseApi < Grape::API
        def self.inherited(subclass)
          super
          subclass.instance_eval do
            format :json
            insert_after Grape::Middleware::Formatter, Grape::Middleware::Logger

            helpers QuoteApp::V1::Helpers::SharedParams
            helpers QuoteApp::V1::Helpers::ApplicationHelper
            helpers QuoteApp::V1::Helpers::AuthenticationHelper
          end
        end
      end
    end
  end
end
