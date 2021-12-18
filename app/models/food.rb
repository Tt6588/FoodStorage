class Food < ApplicationRecord
  
  belongs_to :user
  # belongs_to :genre
  has_many :comments, dependent: :destroy
  has_many :notices, dependent: :destroy
  
  attachment :image
  
  def start_time #カレンダー表示させるため追加
    self.deadline_time
  end
  
  
  scope :latest, -> {order(updated_at: :desc)}
  scope :latest2, -> {order(updated_at: :asc)}
  
  validates :food_name, presence: true, length: { maximum: 15 } 
  validates :detail, length: { in: 0..300 } 
  validates :quantity, presence: true
  validates :deadline_time, presence: true
  validates :genre, presence: true, length: { maximum: 15 } 
  
end
