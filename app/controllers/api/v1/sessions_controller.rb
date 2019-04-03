module Api
  module V1
    class SessionsController < Devise::SessionsController
      respond_to :json
      # User Sign in (POST request)
      # http://0.0.0.0:3000/api/v1/users/sign_in
      # params {"user":{"email":"abc@gmail.com", "password":"password"}}
      def create
        super
      end

    end
  end
end
