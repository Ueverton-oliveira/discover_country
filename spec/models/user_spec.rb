require 'rails_helper'

RSpec.describe User, type: :model do
  describe 'validations' do
    it { should validate_presence_of(:email) }
    it { should validate_uniqueness_of(:email).case_insensitive }
    it { should allow_value('user@example.com').for(:email) }
    it { should_not allow_value('invalid_email').for(:email) }

    it { should validate_presence_of(:password) }
    it { should validate_length_of(:password).is_at_least(8).on(:create) }
  end

  describe 'password encryption' do
    it 'does not save plain-text password to the database' do
      user = create(:user, email: 'test@example.com', password: 'password123')
      expect(user.password_digest).not_to eq('password123')
    end

    it 'authenticates user with valid credentials' do
      user = create(:user, email: 'test@example.com', password: 'password123')
      authenticated_user = User.find_by(email: 'test@example.com').try(:authenticate, 'password123')
      expect(authenticated_user).to eq(user)
    end

    it 'does not authenticate user with invalid credentials' do
      user = create(:user, email: 'test@example.com', password: 'password123')
      authenticated_user = User.find_by(email: 'test@example.com').try(:authenticate, 'wrongpassword')
      expect(authenticated_user).to eq(false)
    end
  end
end
