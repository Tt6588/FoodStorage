class ShareComment < ApplicationRecord

  belongs_to :group
  belongs_to :share_food
  # has_many :notices, dependent: :destroy
  
  validates :comment, presence: true, length: { in: 1..300 } 

end
