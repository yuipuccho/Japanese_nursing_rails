module Logic
  module Users

    # Create guest user record.
    # @return user instance.
    def create_guest_user(user_name)
      guest_user = User.new(user_name: user_name,
                            email: "guest_#{Time.now.to_i}#{rand(100)}@example.com")
      guest_user.auth_token = Devise.friendly_token
      guest_user.save!(validate: false)
      guest_user
    end
  end
end