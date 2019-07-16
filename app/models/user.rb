# frozen_string_literal: true

class User < ActiveRecord::Base
  has_secure_password

  validates :email, uniqueness: true, confirmation: { case_sensitive: false }
  validates :password_confirmation, confirmation: true
  validates :password, presence: true, length: { minimum: 5 }
  validates :first_name, presence: true
  validates :last_name, presence: true

  def self.authenticate_with_credentials(email, password)
    user = User.find_by_email(email.downcase.strip)

    @user = (user if user&.authenticate(password))
  end
end
