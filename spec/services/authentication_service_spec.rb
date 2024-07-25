require 'rails_helper'

RSpec.describe AuthenticationService, type: :service do
  describe '#authenticate' do
    let!(:user) { create(:user, email: 'test@example.com', password: 'password123') }
    let(:authentication_service) { AuthenticationService.new('test@example.com', 'password123') }

    it 'returns a valid JWT token' do
      token = authentication_service.authenticate
      expect(token).not_to be_nil
    end

    it 'token contains correct user_id' do
      token = authentication_service.authenticate
      decoded_token = JWT.decode(token, ENV['SECRET_KEY_BASE'], true, { algorithm: 'HS256' })
      expect(decoded_token.first['user_id']).to eq(user.id)
    end
  end
end
