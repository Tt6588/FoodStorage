class Group < ApplicationRecord

  has_many :group_users, dependent: :destroy
  has_many :users, through: :group_users

  has_many :share_foods, dependent: :destroy
  has_many :share_comments, dependent: :destroy
  has_many :notices, dependent: :destroy
  
  validates :name, presence: true, length: { maximum: 15 } , uniqueness: true

end
