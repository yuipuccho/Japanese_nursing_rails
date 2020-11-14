module V1
  class UsersController < ApplicationController
    include Logic::Users

    def create
      users = create_guest_user params[:user_name]
      render json: users, each_serializer: UsersSerializer
    end
  end
end
