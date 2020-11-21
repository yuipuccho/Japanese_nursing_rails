# == Schema Information
#
# Table name: masters
#
#  id         :bigint           not null, primary key
#  name       :string(255)      not null
#  created_at :datetime         not null
#  updated_at :datetime         not null
#
module V1
  class MastersSerializer < ActiveModel::Serializer
    attributes :result, :message
    has_many :masters

    def result
      true
    end

    def message
      "取得しました。"
    end

    class MasterSerializer < ActiveModel::Serializer
      attributes :id, :name, :created_at, :updated_at
    end

  end
end
