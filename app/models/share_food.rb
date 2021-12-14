class ShareFood < ApplicationRecord

  belongs_to :group
  # belongs_to :genre
  has_many :share_comments, dependent: :destroy
  has_many :notices, dependent: :destroy
  
  
  attachment :image
  
  def start_time #カレンダー表示させるため追加
    self.deadline_time
  end
  
  validates :food_name, presence: true, length: { maximum: 15 } 
  validates :detail, length: { in: 0..300 } 
  validates :quantity, presence: true
  validates :deadline_time, presence: true
  validates :genre, presence: true, length: { maximum: 15 } 

end
