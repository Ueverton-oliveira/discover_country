require 'jwt'

class AuthenticationService
  attr_reader :email, :password
  def initialize(email, password)
    @email = email
    @password = password
  end

  def authenticate
    user = User.find_by(email: email)
    return nil unless user&.authenticate(password)
    generate_token(user)
  end

  private

  def generate_token(user)
    payload = { user_id: user.id }
    JWT.encode(payload, ENV['SECRET_KEY_BASE'], 'HS256')
  end
end
