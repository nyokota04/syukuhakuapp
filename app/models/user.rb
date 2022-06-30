class User < ApplicationRecord
  # Include default devise modules. Others available are:
  # :confirmable, :lockable, :timeoutable, :trackable and :omniauthable
  devise :database_authenticatable, :registerable,
         :recoverable, :rememberable, :validatable
         
  # belongs_to :user
  belongs_to :reserve, optional: true

  has_one_attached :user_img

  # has_meny :rooms, dependent: :destroy
end
