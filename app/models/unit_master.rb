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
    # learned_word_ids = current_user.learning_histories.is_remembered.pluck(:word_master_id).uniq
    user_learning_histories = current_user.learning_histories.desc
    remember_word_ids = []
    not_remember_word_ids = []
    user_learning_histories.each do |learned|
      word_master_id = learned.word_master_id
      if learned.is_remember && !remember_word_ids.include?(word_master_id) && !not_remember_word_ids.include?(word_master_id)
        remember_word_ids << word_master_id
      elsif !learned.is_remember && !remember_word_ids.include?(word_master_id) && !not_remember_word_ids.include?(word_master_id)
        not_remember_word_ids << word_master_id
      end
    end
    (remember_word_ids & learning_histories).count
  end
end
