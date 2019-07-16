# frozen_string_literal: true

require 'rails_helper'

RSpec.describe User, type: :model do
  before(:each) do
    @user = User.create(
      email: '123@email.com',
      password: '12345',
      password_confirmation: '12345',
      first_name: 'Bob',
      last_name: 'Smith'
    )
  end

  describe 'Validations' do
    it 'User should be created if all fields are valid' do
      expect(@user).to be_valid
    end

    it 'Should not be valid if first_name is nil' do
      @user.first_name = nil

      expect(@user).to_not be_valid
    end

    it 'Should not be valid if last_name is nil' do
      @user.last_name = nil
      expect(@user).to_not be_valid
    end

    it 'Should not be valid if password does not match password confirmation' do
      expect(@user.password).to_not eql 'abc'
    end

    it 'Should be valid if password matches password confirmation' do
      expect(@user.password).to eql @user.password_confirmation
    end

    it 'Should not be valid if password is too short' do
      @user.password = '1234'
      @user.password_confirmation = '1234'
      expect(@user).to_not be_valid
    end

    it 'Should not be valid if email is not unique' do
      @user2 = User.create(
        email: '123@email.com',
        password: '12345',
        password_confirmation: '12345',
        first_name: 'Rick',
        last_name: 'James'
      )
      expect(@user2).to_not be_valid
    end
  end

  describe '.authenticate_with_credentials' do
    it 'Should return @user if the correct email and password are passed' do
      expect(User.authenticate_with_credentials('123@email.com', '12345')).to eql @user
    end

    it 'Should return nil if the incorrect email is passed' do
      expect(User.authenticate_with_credentials('wrong@email.com', '12345')).to eql nil
    end

    it 'Should return nil if the incorrect password is passed' do
      expect(User.authenticate_with_credentials('123@email.com', 'wrong')).to eql nil
    end

    it 'Should fail if the incorrect number of parameters are passed' do
      expect { User.authenticate_with_credentials('123@email.com') }.to raise_error(ArgumentError)
    end

    it 'Should authenticate email if the incorrect(uppercase) email is provided' do
      expect(User.authenticate_with_credentials('123@EMAIL.COM', '12345')).to eql @user
    end

    it 'Should authenticate email if whitespace is present' do
      expect(User.authenticate_with_credentials('   123@email.com   ', '12345')).to eql @user
    end
  end
end
