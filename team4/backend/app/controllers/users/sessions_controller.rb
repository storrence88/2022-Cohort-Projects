# frozen_string_literal: true

class Users::SessionsController < Devise::SessionsController
  protect_from_forgery with: :null_session

  respond_to :json

  private

  def respond_with(resource, _opts = {})
    render json: {
      status: { code: 200, message: 'Successfully logged in' },
      data: UserSerializer.new(resource).serializable_hash[:data][:attributes]
    }, status: :ok
  end

  def respond_to_on_destroy
    if current_user
      render json: { status: 200, message: 'Successfully logged out' }, status: :ok
    else
      render json: { status: 401, message: 'Could not find an active session' }, status: :unauthorized
    end
  end
end
