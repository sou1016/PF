class Public::PostsController < ApplicationController
  def new
    @post = Post.new
  end

  def create
    @post = Post.new(post_params)
    @post.member_id = current_member.id
    @post.save
    redirect_to public_posts_path
  end

  def index
    @post = Post.all
    # @member = ?
  end

  def show
    @post = Post.find(params[:id])
    @post_comment = PostComment.new
  end

  def edit
    @post = Post.find(params[:id])
  end
  
  def update
    @post = Post.find(params[:id])
    if @post.member_id = current_member.id
      @post.update(post_params)
      redirect_to public_post_path(@post)
    else
      render :edit
    end
  end 

  def destroy
    @post = Post.find(params[:id])
    @post.destroy
    redirect_to public_posts_path
  end


  private

  def post_params
    params.require(:post).permit(:image, :body)
  end
end
