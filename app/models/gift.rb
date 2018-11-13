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

class Gift < ApplicationRecord
  belongs_to :user
  has_one :reserve
end
