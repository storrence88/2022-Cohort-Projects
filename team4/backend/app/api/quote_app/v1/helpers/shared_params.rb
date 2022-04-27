# frozen_string_literal: true

module QuoteApp
  module V1
    module Helpers
      module SharedParams
        extend Grape::API::Helpers

        params :paginatable do
          optional :page, type: String, desc: 'Current page.', default: 1
          optional :per, type: String, desc: 'Number of items per page.', default: 20
        end
      end
    end
  end
end
