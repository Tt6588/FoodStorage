class Notice < ApplicationRecord
  
  
  belongs_to :user
  belongs_to :food
  belongs_to :comment
  
end
