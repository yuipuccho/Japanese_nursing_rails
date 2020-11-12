class ApplicationController < ActionController::API
  include AbstractController::Translation
  include AuthUtil

  def authenticate_user_from_token!
    auth_token = request.headers['Authorization']
    if auth_token
      authenticate_with_auth_token auth_token
    else
      raise_auth_error!
    end
  end

  def authenticate_with_auth_token auth_token
    unless auth_token.include?(':')
      raise_auth_error!
      return
    end

    # Extract user_id from auth_token.
    user_id = auth_token.split(':').first
    user = User.find(id: user_id)

    if user && Devise.secure_compare(user.auth_token, auth_token)
      sign_in user, store: false
    else
      raise_auth_error!
    end
  end
end
