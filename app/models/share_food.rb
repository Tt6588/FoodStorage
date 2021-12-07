class ShareFood < ApplicationRecord
  
  belongs_to :group
  belongs_to :genre
  has_many :share_foo, dependent: :destroy
  has_many :notises, dependent: :destroy
  
end
