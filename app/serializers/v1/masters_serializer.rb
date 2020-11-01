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
  end
end
