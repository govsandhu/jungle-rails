# frozen_string_literal: true

class LinkingReviewsToProductsAndUsers < ActiveRecord::Migration
  def change
    remove_column :reviews, :user_id
    remove_column :reviews, :product_id
    add_reference :reviews, :user, foreign_key: true
    add_reference :reviews, :product, foreign_key: true
  end
end
