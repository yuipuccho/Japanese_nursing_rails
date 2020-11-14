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
require 'test_helper'

class UnitMasterTest < ActiveSupport::TestCase
  # test "the truth" do
  #   assert true
  # end
end
