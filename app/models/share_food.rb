class ShareFood < ApplicationRecord

  belongs_to :group
  # belongs_to :genre
  has_many :share_comments, dependent: :destroy
  has_many :notices, dependent: :destroy

end
