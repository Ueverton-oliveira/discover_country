class User < ApplicationRecord
  # armazenar a senha de forma segura e permite verificar as credenciais do usuário.
  has_secure_password

  validates :email, presence: true, uniqueness: { case_sensitive: false }, format: { with: URI::MailTo::EMAIL_REGEXP }
  validates :password, presence: true, length: { minimum: 8 }, if: -> { new_record? || !password.nil? }
end
