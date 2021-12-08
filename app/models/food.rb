class Food < ApplicationRecord
  
  belongs_to :user
  belongs_to :genre
  has_many :comments, dependent: :destroy
  has_many :notices, dependent: :destroy
  
  attachment :image
  
end
