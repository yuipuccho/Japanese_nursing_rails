module V1
  class DefaultSerializer < ActiveModel::Serializer
    attributes :result, :message
    has_one :body

    def result
      true
    end

    def message
      "取得しました。"
    end

    def body
      object
    end
  end
end