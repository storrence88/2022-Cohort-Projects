# frozen_string_literal: true

module QuoteApp
  module V1
    module Helpers
      module ApplicationHelper
        # Returns the extracted params that where declared
        # on the grape params definition filtering all uneeded
        # paramaters that might been sent to the endpoint
        #
        # @param [Hash] hash of parameters
        # @return [Hash] cleaned hash of parameters
        def extract(params)
          declared(params, { include_missing: false }, route.params.keys)
        end

        # Evaluatates an expression in a block and
        # returns a resource if expression returns true
        # otherwise raises an invalid resource error
        #
        # @param [Object] resource that will evaluate
        # @param [Block] expression to be evaluated
        # @return [Object] Returns the passed object or raises error
        def return_resource!(resource, &assertion)
          if resource.instance_eval(&assertion)
            resource
          else
            invalid_resource!(resource)
          end
        end

        # Gets errors from a resource and sets it in a hash
        #
        # @param [Object] Resources with errors
        # @param [Integer] Error code to be given as response
        # @return [Error] Raises an error and returns the response error code
        def invalid_resource!(resource, response_error = 422)
          error!({ error: resource.errors }, response_error)
        end

        # Returns pagination data on the response
        # and headers
        #
        # @param [Scope] Scope used to fetch pagination data from
        # @return [Hash] Metadata hash given to the json response
        def metadata_for(scope)
          meta_data = {
            total_count: scope.total_count,
            current_page: scope.current_page,
            total_pages: scope.total_pages,
            per_page: scope.limit_value
          }

          meta_data.each_pair { |key, value| header key, value }
          { meta: meta_data }
        end
      end
    end
  end
end
