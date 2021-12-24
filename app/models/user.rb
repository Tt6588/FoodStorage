class User < ApplicationRecord
  # Include default devise modules. Others available are:
  # :confirmable, :lockable, :timeoutable, :trackable and :omniauthable
  devise :database_authenticatable, :registerable,
         :recoverable, :rememberable, :validatable

  has_many :foods, dependent: :destroy
  has_many :comments, dependent: :destroy
  # has_many :notices, dependent: :destroy

  #共有管理用アソシエーション
  has_many :group_users, dependent: :destroy
  has_many :groups, through: :group_users

  attachment :profile_image #プロフィール画像用
  validates :name, presence: true, uniqueness: true, length: { minimum: 2, maximum: 15 }
end
