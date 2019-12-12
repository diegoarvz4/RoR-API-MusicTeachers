class AuthenticationController < ApplicationController
  skip_before_action :authorize_request, only: :authenticate
  # return auth token once user is authenticated
  def authenticate
    auth_token =
      AuthenticateUser.new(params[:email].to_s, params[:password].to_s).call
    json_response(auth_token: auth_token)
  end

  private

  def auth_params
    params.permit(:email, :password)
  end
end
