# == Schema Information
#
# Table name: gifts
#
#  id          :integer          not null, primary key
#  title       :string
#  description :text
#  link        :string
#  created_at  :datetime         not null
#  updated_at  :datetime         not null
#  user_id     :integer
#

require 'test_helper'

class GiftTest < ActiveSupport::TestCase
  # test "the truth" do
  #   assert true
  # end
end
