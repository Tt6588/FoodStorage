class Comment < ApplicationRecord
  
  belongs_to :user
  belongs_to :food
  has_many :notises, dependent: :destroy
  
end
