# == Schema Information
#
# Table name: unit_masters
#
#  id         :bigint           not null, primary key
#  japanese   :string(255)      not null
#  vietnamese :string(255)      not null
#  created_at :datetime         not null
#  updated_at :datetime         not null
#
class UnitMaster < ApplicationRecord
  has_many :word_masters

  validates :japanese, presence: true
  validates :vietnamese, presence: true
end
