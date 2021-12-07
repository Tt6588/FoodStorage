class Comment < ApplicationRecord
  
  belongs_to :user
  belongs_to :food
  has_many :notices, dependent: :destroy
  
end
