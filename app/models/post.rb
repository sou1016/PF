class Post < ApplicationRecord
  
  # アソシエーション
  belongs_to :member
  
# アクティブストレージ
  has_one_attached :image
  
  def get_image(width, height)
    if image.attached?
      image.variant(resize_to_limit: [width, height]).processed
    end
  end
  
end
