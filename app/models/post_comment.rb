class PostComment < ApplicationRecord
  belongs_to :member, :foreign_key => 'member_id'
  belongs_to :post, :foreign_key => 'post_id'
end