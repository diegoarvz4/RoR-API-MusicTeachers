# frozen_string_literal: true

class AuthenticateUser
  def initialize(email, password)
    @email = email
    @password = password
  end

  def call
    if user
      return [JsonWebToken.encode(user_id: user.id), { id: @user.id, username: @user.username, email: @user.email }]
    end
  end

  private

  attr_reader :email, :password

  def user
    @user = User.find_by(email: email)
    return @user if @user && @user.authenticate(password)

    raise(ExceptionHandler::AuthenticationError, Message.invalid_credentials)
  end
end
