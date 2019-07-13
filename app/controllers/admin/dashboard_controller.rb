# frozen_string_literal: true

class Admin::DashboardController < ApplicationController
  http_basic_authenticate_with name: ENV['ADMINUSERNAME'], password: ENV['ADMINPASSWORD']
  def show; end
end
