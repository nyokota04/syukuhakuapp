class Reserve < ApplicationRecord
  belongs_to :user, optional: true
  belongs_to :room, optional: true
  has_one_attached :room_img
  has_many :users
  # has_many :rooms
  

end
