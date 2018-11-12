# == Schema Information
#
# Table name: reserves
#
#  id         :integer          not null, primary key
#  user_id    :integer
#  gift_id    :integer
#  created_at :datetime         not null
#  updated_at :datetime         not null
#  confirmed  :boolean          default(FALSE)
#

require 'test_helper'

class ReserveTest < ActiveSupport::TestCase
  # test "the truth" do
  #   assert true
  # end
end
