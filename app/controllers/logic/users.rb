module Logic
  class Users

    # Create guest user record.
    # @return user instance.
    def create_guest_user
      guest_user = User.new(name: 'guest',
                            email: "guest_#{Time.now.to_i}#{rand(100)}@example.com")
      guest_user.save!(validate: false)
      guest_user
    end
  end
end