module V1
  class UsersSerializer < ActiveModel::Serializer
    attributes :id, :email, :auth_token

    def result
      true
    end

    def message
      "呼び出しに成功しました。"
    end
  end
end