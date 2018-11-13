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

class Reserve < ApplicationRecord
  belongs_to :user
  belongs_to :gift
  # belongs_to :gift
end
