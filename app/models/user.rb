class User < ApplicationRecord

  validates :name, {presence: true}
  validates :email, {presence: true, uniqueness: true}
  validates :image_name, {presence: true}

  has_secure_password

  has_many :posts, dependent: :destroy        #これでユーザーデータを削除すれば、そのユーザーに結びつく投稿データも同時に削除される


end
