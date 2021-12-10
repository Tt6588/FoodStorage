class User < ApplicationRecord
  # Include default devise modules. Others available are:
  # :confirmable, :lockable, :timeoutable, :trackable and :omniauthable
  devise :database_authenticatable, :registerable,
         :recoverable, :rememberable, :validatable
         
  has_many :foods, dependent: :destroy
  has_many :comments, dependent: :destroy
  has_many :notices, dependent: :destroy
  
  attachment :profile_image #プロフィール画像用
  
  #共有管理用アソシエーション
  has_many :group_users, dependent: :destroy
  # has_many :groups, through: :group_users
end
