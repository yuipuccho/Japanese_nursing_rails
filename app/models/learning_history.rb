# == Schema Information
#
# Table name: learning_histories
#
#  id             :bigint           not null, primary key
#  is_remember    :boolean          default(FALSE), not null
#  created_at     :datetime         not null
#  updated_at     :datetime         not null
#  user_id        :bigint
#  word_master_id :bigint
#
# Indexes
#
#  index_learning_histories_on_user_id         (user_id)
#  index_learning_histories_on_word_master_id  (word_master_id)
#
# Foreign Keys
#
#  fk_rails_...  (user_id => users.id)
#  fk_rails_...  (word_master_id => word_masters.id)
#
class LearningHistory < ApplicationRecord
  belongs_to :user
  belongs_to :word_master
end
