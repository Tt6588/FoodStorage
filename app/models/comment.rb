class Comment < ApplicationRecord
  
  belongs_to :user
  belongs_to :food
  # has_many :notices, dependent: :destroy
  
  validates :comment, presence: true, length: { in: 0..300 } 
  
end
