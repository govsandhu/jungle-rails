# frozen_string_literal: true

class OrderMailerPreview < ActionMailer::Preview
  def order_email
    OrderMailer.order_email(user: User.first, order: Order.first)
  end
end
