# frozen_string_literal: true

require 'rails_helper'

RSpec.describe Product, type: :model do
  describe 'Validations' do
    before(:each) do
      @category = Category.new(
        name: 'Sports equipment'
      )
    end
    it 'Product should save if all fields are set' do
      product = Product.new(
        name: 'Basketball',
        price: 10,
        quantity: 50,
        category: @category
      )
      expect(product).to be_valid
    end

    it 'Should not be valid if name is nil' do
      product = Product.create(
        price: 10,
        quantity: 50,
        category: @category
      )
      expect(product.errors.full_messages).to include "Name can't be blank"
    end
    it 'Should not be valid if price is nil' do
      product = Product.create(
        name: 'Basketball',
        quantity: 50,
        category: @category
      )
      expect(product.errors.full_messages).to include "Price can't be blank"
    end
    it 'Should not be valid if quantity is nil' do
      product = Product.create(
        name: 'Basketball',
        price: 10,
        category: @category
      )
      expect(product.errors.full_messages).to include "Quantity can't be blank"
    end
    it 'Should not be valid if category is nil' do
      product = Product.create(
        name: 'Basketball',
        price: 10,
        quantity: 50
      )
      expect(product.errors.full_messages).to include "Category can't be blank"
    end
  end
end
