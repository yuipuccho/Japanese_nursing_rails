# == Schema Information
#
# Table name: test_histories
#
#  id                :bigint           not null, primary key
#  is_collect_answer :boolean          not null
#  created_at        :datetime         not null
#  updated_at        :datetime         not null
#  user_id           :bigint
#  word_master_id    :bigint
#
# Indexes
#
#  index_test_histories_on_user_id         (user_id)
#  index_test_histories_on_word_master_id  (word_master_id)
#
# Foreign Keys
#
#  fk_rails_...  (user_id => users.id)
#  fk_rails_...  (word_master_id => word_masters.id)
#
require 'test_helper'

class TestHistoryTest < ActiveSupport::TestCase
  # test "the truth" do
  #   assert true
  # end
end
