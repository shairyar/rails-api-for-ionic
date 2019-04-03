module Api
  module V1
    class RegistrationsController < Devise::RegistrationsController
      respond_to :json

      # User Sign Up (POST request)
      # http://0.0.0.0:3000/api/v1/registrations
      # params {"user":{"name":"John Doe", "email":"john@example.com", "password":"password", "password_confirmation":"password"}}
      def create
        super
      end

      def update
        super
      end
    end
  end
end
