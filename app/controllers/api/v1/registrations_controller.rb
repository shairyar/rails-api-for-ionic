module Api
  module V1
    class RegistrationsController < Devise::RegistrationsController
      respond_to :json

      # User Sign Up (POST request)
      # http://0.0.0.0:3000/api/v1/registrations
      # params {"user":{"name":"John Doe", "email":"john@example.com", "password":"password", "password_confirmation":"password"}}
      def create
        user = User.new(user_params)
        if user.save
          render 'api/v1/users/show', locals: {rows: user}
        else
          render json: {success: false, message: user.errors.full_messages.join(', '), status: 400}
        end
      end

      ###############################
      private
      ###############################

      def user_params
        params.require(:user).permit(:name, :email, :password, :password_confirmation)
      end

    end
  end
end
