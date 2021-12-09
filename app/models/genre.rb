class Genre < ApplicationRecord

  # has_many :foods, dependent: :destroy

  #共有管理用アソシエーション
  # has_many :share_foods, dependent: :destroy

end
