class Genre < ApplicationRecord
  # アソシエーション
  belongs_to :post, optional: true

end
