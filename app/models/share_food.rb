class ShareFood < ApplicationRecord

  belongs_to :group
  # belongs_to :genre
  has_many :share_comments, dependent: :destroy
  has_many :notices, dependent: :destroy
  
  
  attachment :image
  
  def start_time #カレンダー表示させるため追加
    self.deadline_time
  end

end
