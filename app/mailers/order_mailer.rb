# frozen_string_literal: true

class OrderMailer < ApplicationMailer
  default from: 'no-reply@jungle.com'

  def order_email(params)
    @order = params[:order]
    @user = params[:user]
    mail(to: @user.email, subject: "Order confirmation: #{@order.id}")
  end
end
