# == Schema Information
#
# Table name: users
#
#  id                     :integer          not null, primary key
#  email                  :string           default(""), not null
#  encrypted_password     :string           default(""), not null
#  reset_password_token   :string
#  reset_password_sent_at :datetime
#  remember_created_at    :datetime
#  created_at             :datetime         not null
#  updated_at             :datetime         not null
#  name                   :string
#  username               :string
#  bio                    :text
#  link                   :string
#  image                  :string
#

class User < ApplicationRecord
  # Associate the image from uploader to user profile
  mount_uploader :image, ImageUploader

  # Users may have many gift items in their wishlist
  has_many :gifts

  # For reserving gifts
  has_many :reserves, class_name: "Reserve"

  # Users can be friends
  has_many :active_relationships,
           class_name: "Relationship",
           foreign_key: "follower_id",
           dependent: :destroy

  # Devise stuff
  devise :database_authenticatable,
         :registerable, :recoverable,
         :rememberable, :validatable
  # Include default devise modules. Others available are:
  # :confirmable, :lockable, :timeoutable, :trackable and :omniauthable
end
