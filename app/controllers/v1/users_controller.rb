module V1
  class UsersController < ApplicationController
    include Logic::Users

    def create
      users = create_guest_user params[:user_name]
      render json: users, each_serializer: UsersSerializer
    end

    def update
      users = User.find(params[:id])
      users.update!(user_name: params[:user_name])
      render json: { result: true, message: t('masters.create.success') }
    end

  end
end
