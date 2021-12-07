class Group < ApplicationRecord
  
  has_many :group_users, dependent: :destroy
  has_many :share_foods, dependent: :destroy
  has_many :shacomments, dependent: :destroy
  
end
