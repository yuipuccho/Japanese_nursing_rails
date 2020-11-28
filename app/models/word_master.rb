# == Schema Information
#
# Table name: word_masters
#
#  id             :bigint           not null, primary key
#  english        :string(255)      not null
#  furigana       :string(255)
#  japanese       :string(255)      not null
#  vietnamese     :string(255)      not null
#  created_at     :datetime         not null
#  updated_at     :datetime         not null
#  unit_master_id :bigint
#
# Indexes
#
#  index_word_masters_on_unit_master_id  (unit_master_id)
#
# Foreign Keys
#
#  fk_rails_...  (unit_master_id => unit_masters.id)
#
class WordMaster < ApplicationRecord
  include ModelLogic::WordMaster

  has_many :test_histories
  has_many :learning_histories
  belongs_to :unit_master

  before_create :update_word_master_count!

  validates :english, presence: true
  validates :japanese, presence: true
  validates :vietnamese, presence: true
end
