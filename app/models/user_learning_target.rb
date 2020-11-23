# == Schema Information
#
# Table name: user_learning_targets
#
#  id                    :bigint           not null, primary key
#  target_learning_count :integer          default(0), not null
#  target_testing_count  :integer          default(0), not null
#  created_at            :datetime         not null
#  updated_at            :datetime         not null
#  user_id               :bigint
#
# Indexes
#
#  index_user_learning_targets_on_user_id  (user_id)
#
# Foreign Keys
#
#  fk_rails_...  (user_id => users.id)
#
class UserLearningTarget < ApplicationRecord
  belongs_to :user

  validates :target_learning_count,
            numericality: { only_integer: true, greater_than_or_equal_to: 0, less_than_or_equal_to: 10000 }
  validates :target_testing_count,
            numericality: { only_integer: true, greater_than_or_equal_to: 0, less_than_or_equal_to: 10000 }
end
