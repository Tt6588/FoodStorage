class Food < ApplicationRecord
  
  belongs_to :user
  # belongs_to :genre
  has_many :comments, dependent: :destroy
  has_many :notices, dependent: :destroy
  
  attachment :image
  
  def start_time #カレンダー表示させるため追加
    self.deadline_time
  end
  
  #ソート機能　期限
  scope :latest1, -> {order(deadline_time: :asc)}
  scope :latest2, -> {order(deadline_time: :desc)}
  
  #ソート機能　作成日
  scope :latest3, -> {order(created_at: :asc)}
  scope :latest4, -> {order(created_at: :desc)}
  
  validates :food_name, presence: true, length: { maximum: 15 } 
  validates :detail, length: { in: 0..300 } 
  validates :quantity, presence: true
  validates :deadline_time, presence: true
  validates :genre, presence: true, length: { maximum: 15 } 
  
end
