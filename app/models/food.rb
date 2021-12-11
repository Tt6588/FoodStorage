class Food < ApplicationRecord
  
  belongs_to :user
  # belongs_to :genre
  has_many :comments, dependent: :destroy
  has_many :notices, dependent: :destroy
  
  attachment :image
  
  def start_time #カレンダー表示させるため追加
    self.deadline_time
  end
  
end
