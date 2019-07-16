# frozen_string_literal: true

require 'rails_helper'

RSpec.feature 'Visitor navigates to the product details page', type: :feature, js: true do
  before :each do
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

  scenario 'They see the product details' do
    # ACT
    visit root_path
    first('article.product').find_link('Details').click

    # DEBUG / VERIFY
    save_screenshot
    expect(page).to have_css 'article.product-detail'
  end
end
