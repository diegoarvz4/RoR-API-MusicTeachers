# frozen_string_literal: true

class UsersController < ApplicationController
  skip_before_action :authorize_request, only: :create

  def create
    user = User.create!(user_params)
    auth_token = AuthenticateUser.new(user.email.to_s, user.password.to_s).call
    response = { message: Message.account_created, auth_token: auth_token }
    json_response(response, :created)
    # json_response(user, :created)
  end

  private

  def user_params
    params.permit(
      :username,
      :email,
      :password,
      :password_confirmation
    )
  end
end
