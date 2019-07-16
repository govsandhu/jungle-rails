# frozen_string_literal: true

require 'rails_helper'

RSpec.feature 'Visitor adds an item to their cart', type: :feature, js: true do
  before :each do
    @user = User.create!(
      first_name: 'Morty',
      last_name: 'Smith',
      email: 'test@user.com',
      password: '123456',
      password_confirmation: '123456'
    )

    @category = Category.create! name: 'Apparel'

    10.times do |_n|
      @category.products.create!(
        name: Faker::Hipster.sentence(3),
        description: Faker::Hipster.paragraph(4),
        image: open_asset('apparel1.jpg'),
        quantity: 10,
        price: 64.99
      )
    end
  end

  scenario 'They see My Cart(1)' do
    # ACT
    visit login_path
    fill_in 'email', with: 'test@user.com'
    fill_in 'password', with: '123456'
    click_button 'Submit'

    first('article.product').find_button('Add').click

    sleep 5

    # DEBUG / VERIFY
    save_screenshot
    expect(page).to have_content 'My Cart (1)'
  end
end
