class Public::PostCommentsController < ApplicationController
  def create
    post = Post.find(params[:post_id])
    comment = PostComment.new(post_comment_params)
    comment.member_id = current_member.id
    comment.post_id = post.id
    comment.save
    redirect_to public_posts_path
  end


  private

  def post_comment_params
    params.require(:post_comment).permit(:comment)
  end

end
