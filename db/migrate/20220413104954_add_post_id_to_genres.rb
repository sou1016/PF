class AddPostIdToGenres < ActiveRecord::Migration[6.1]
  def change
    add_reference :genres, :post, foreign_key: true
  end
end
