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
    attributes :id, :name

    def result
      true
    end

    def message
      "呼び出しに成功しました。"
    end
  end
end
