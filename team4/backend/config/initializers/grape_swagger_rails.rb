# frozen_string_literal: true

GrapeSwaggerRails.options.url = '/api/v1/api-docs'
GrapeSwaggerRails.options.before_action do
  GrapeSwaggerRails.options.app_url = request.protocol + request.host_with_port
end
# GrapeSwaggerRails.options.before_action do |_request|
#   if ActiveRecord::Base.connection.table_exists?('users') && user = User.find_by_email('steve@cratebind.com')
#     GrapeSwaggerRails.options.headers['AUTHORIZATION'] = user.auth_token
#   end
# end
