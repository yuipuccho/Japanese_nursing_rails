# Custom util auth methods.
module AuthUtils
  extend ActiveSupport::Concern

  included do
    def authenticated?
      return false unless params[:auth_token] || request.headers['Authorization']

      auth_token = params[:auth_token] || request.headers['Authorization']
      @current_user = User.find_by(auth_token: auth_token)
    end

    def authenticated!
      return true if authenticated?

      raise_auth_error!
    end

    def raise_auth_error!
      render json: { error: t('devise.failure.unauthenticated') }, status: 401
    end

    def current_user
      @current_user
    end
  end
end