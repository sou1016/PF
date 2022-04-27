class Post < ApplicationRecord

  # アソシエーション
  belongs_to :member, :foreign_key => 'member_id'
  belongs_to :genre
  has_many :favorites, dependent: :destroy
  has_many :post_comments, dependent: :destroy
  
  # バリデーション
  validates :body, presence: true
  validates :image, presence: true

  # 検索方法分岐
  def self.looks(search, word)
    if search == "partial_match"
      @post = Post.joins(:genre).where( "body LIKE ? ", "%#{word}%")
    else
      @post = Post.all
    end
  end


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
