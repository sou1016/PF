class Post < ApplicationRecord
  
  # アソシエーション
  belongs_to :member, :foreign_key => 'member_id'
  has_many :genre, dependent: :destroy
  has_many :favorites, dependent: :destroy
  has_many :post_comments, dependent: :destroy
  
# アクティブストレージ
  has_one_attached :image
  
  def get_image(width, height)
    if image.attached?
      image.variant(resize_to_limit: [width, height]).processed
    end
  end
  
  # いいね機能
  def favorited_by?(member)
    favorites.exists?(member_id: member.id)
  end
  
end
