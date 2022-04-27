# frozen_string_literal: true

module QuoteApp
  module V1
    class Authenticated < Grape::API
      before { authenticate! }

      mount QuoteApp::V1::Resources::Users
    end
  end
end
