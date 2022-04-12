class CreatePosts < ActiveRecord::Migration[6.1]
  def change
    create_table :posts do |t|
      t.integer :member_id
      t.integer :genres_id
      t.string :body, null: false

      t.timestamps
    end
  end
end
