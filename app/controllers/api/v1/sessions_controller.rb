module Api
  module V1
    class SessionsController < ::Devise::SessionsController
      def create
        user = User.find_by_email(sign_in_params[:email])

        if user&.valid_password?(sign_in_params[:password])
          @current_user = user
          render json: { token: user.jwt_token, email: user.email }
        else
          render json: { errors: { 'email or password' => ['is invalid'] } }, status: :unprocessable_entity
        end
      end

      protected

      def sign_in_params
        params.require(:user).permit(:email, :password)
      end
    end
  end
end
