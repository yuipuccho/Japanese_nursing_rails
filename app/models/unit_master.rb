# == Schema Information
#
# Table name: unit_masters
#
#  id         :bigint           not null, primary key
#  japanese   :string(255)      not null
#  vietnamese :string(255)      not null
#  word_count :integer          default(0), not null
#  created_at :datetime         not null
#  updated_at :datetime         not null
#
class UnitMaster < ApplicationRecord
  has_many :word_masters

  validates :japanese, presence: true
  validates :vietnamese, presence: true

  def memorized_word_count(current_user)
    learning_histories = word_masters.pluck(:id).uniq
    learned_word_ids = current_user.learning_histories.is_remembered.pluck(:word_master_id).uniq
    (learned_word_ids & learning_histories).count
  end
end
