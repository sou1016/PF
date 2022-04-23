class Admin::PostsController < ApplicationController
  before_action :ensure_guest_admin
  def index
    @post = Post.all
  end

  def show
    @post = Post.find(params[:id])
  end
end
