class Room < ApplicationRecord
  belongs_to :user, optional: true
  belongs_to :reserve, optional: true
  has_one_attached :room_img
  # has_many :users
  has_many :reserves
end
