class Post < ApplicationRecord
  
  # アソシエーション
  belongs_to :member
  
# アクティブストレージ
  has_one_attached :image
  
  def get_image
    if image.attached?
      image
    end
  end
  
end
