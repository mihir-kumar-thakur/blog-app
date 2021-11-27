module Api
  module V1
    class RegistrationsController < ::Devise::RegistrationsController
      protected

      def sign_up_params
        params.require(:user).permit(:first_name, :last_name, :email, :password, :password_confirmation)
      end
    end
  end
end
