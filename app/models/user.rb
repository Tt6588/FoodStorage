class User < ApplicationRecord
  # Include default devise modules. Others available are:
  # :confirmable, :lockable, :timeoutable, :trackable and :omniauthable
  devise :database_authenticatable, :registerable,
         :recoverable, :rememberable, :validatable
         
  has_many :foods, dependent: :destroy
  has_many :comments, dependent: :destroy　
  has_many :notises, dependent: :destroy
  
  #共有管理用アソシエーション
  has_many :group_user, dependent: :destroy
end
