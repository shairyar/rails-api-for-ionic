class ApiController < ApplicationController

  before_action :authenticate_user!
  respond_to :json

  # Helper to format a successful status, message is optional
  def status_success(message=nil)
    result = {
      success: true
    }
    result[:message] = message if message.present?

    return result
  end
end
