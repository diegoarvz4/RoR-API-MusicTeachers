# frozen_string_literal: true

class AuthenticationController < ApplicationController
  skip_before_action :authorize_request, only: :authenticate
  # return auth token once user is authenticated
  def authenticate
    data =
      AuthenticateUser.new(params[:email].to_s, params[:password].to_s).call
    auth_token = data[0]
    user_data = data[1]
    json_response(auth_token: auth_token, user_data: user_data)
  end

  private

  def auth_params
    params.permit(:email, :password)
  end
end
