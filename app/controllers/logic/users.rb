module Logic
  module Users

    # ゲストユーザーを作成する
    # @param user_name ユーザー名
    # @return ゲストユーザーのインスタンス
    def create_guest_user(user_name)
      guest_user = User.new(user_name: user_name,
                            email: "guest_#{Time.now.to_i}#{rand(100)}@example.com")
      guest_user.add_auth_token
      guest_user.save!(validate: false)
      guest_user
    end

    # 通常ユーザーを作成する
    # @param email メールアドレス
    # @param password パスワード
    # @param user_name ユーザー名
    # @return 通常ユーザーのインスタンス
    def create_user(email, password, user_name)
      user = User.new(email: email,
                      password: password,
                      user_name: user_name,
                      role: 1)
      user.add_auth_token
      user if user.save
    end
  end
end