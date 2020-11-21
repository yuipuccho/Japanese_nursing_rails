module V1
  class UsersController < ApplicationController
    include Logic::Users

    # create guest or normal user.
    # @param is_anonymous 匿名ユーザーかどうか
    # @param user_name ユーザー名
    # @param email メールアドレス
    # @param password パスワード
    def create
      user = if params[:is_anonymous]
               create_guest_user params[:user_name]
             else
               create_user(params[:email], params[:password], params[:user_name])
             end
      if user
        render json: user, serializer: DefaultSerializer
      else
        render_failed_json t('users.create.failed_user_create')
      end
    end

    def update
      users = User.find(params[:id])
      users.update!(user_name: params[:user_name])
      render json: { result: true, message: t('masters.create.success') }
    end

  end
end
