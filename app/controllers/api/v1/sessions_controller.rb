module Api
  module V1
    class SessionsController < Devise::SessionsController
      respond_to :json
      skip_before_action :verify_signed_out_user, only: :destroy

      # User Sign in (POST request)
      # http://0.0.0.0:3000/api/v1/users/sign_in
      # params {"user":{"email":"abc@gmail.com", "password":"password"},
      #         "device":{"token":"abc", "device_platform":"android", "device_version": "0.1.1", "device_model":"huawei", "device_uuid":"abcei-010010-jkk", "app_version":"0.00.0"}
      #         }
      def create
        user_strong_params = user_params

        @user = User.find_by email: user_strong_params[:email]

        if @user.present? && @user.valid_password?(user_strong_params[:password])
          # Touch the user, so as to update last updated at:
          @user.touch
          render 'api/v1/users/show', locals: {rows: @user, result: status_success}
        else
          invalid_login_attempt
        end
      end

      ###############################

      private

      ###############################


      def user_params
        params.require(:user).permit(:email, :password)
      end

      # check validation on user sign in
      def invalid_login_attempt
        warden.custom_failure!
        render json: {success: false, message: 'Please check your credentials and try again.'}, status: 401
      end

      # Helper to format a successful status, message is optional
      def status_success(message = nil)
        result = {success: true}
        result[:message] = message if message.present?

        result
      end

    end
  end
end
