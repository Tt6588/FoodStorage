class ShareComment < ApplicationRecord
  
  belongs_to :group
  belongs_to :share_foods
  has_many :notises, dependent: :destroy
  
end
