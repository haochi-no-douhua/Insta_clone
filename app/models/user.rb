class User < ApplicationRecord
  validates :profile, length: { maximum: 250 }
  mount_uploader :image, ImageUploader
  validates :name,  presence: true, length: { maximum: 10 }
  validates :email, presence: true, length: { maximum: 255 },
             format: { with: /\A[\w+\-.]+@[a-z\d\-.]+\.[a-z]+\z/i }
  before_validation { email.downcase! }
  has_secure_password
  validates :password, presence: true, length: { minimum: 6 }
  validates :image, presence: true
  validates :profile, presence: true
  has_many :blogs
  has_many :favorites, dependent: :destroy
  has_many :user_favorites, through: :favorites, source: :blog
end
