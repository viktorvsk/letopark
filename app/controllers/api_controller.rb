# frozen_string_literal: true

class ApiController < ActionController::API
  attr_reader :current_device

  private

  def set_current_device
    token = request.headers['HTTP_AUTHORIZATION'].gsub(/Bearer /, '')

    @current_device = Device.find_by(access_token: token) || Device.create

    response.set_header('ACCESS_TOKEN', current_device.access_token)
    response.set_header('REFRESH_TOKEN', current_device.refresh_token)
  end
end
