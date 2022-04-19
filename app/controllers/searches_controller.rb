class SearchesController < ApplicationController
  before_action :authenticate_member!
  def search
    @genres = Genre.all
    @range = params[:range]
    if @range == "member"
      @members = Member.looks("partial_match", params[:word])
    elsif params[:format].present?
      @genre = Genre.find(params[:format])
      @posts = @genre.posts
    else
      @posts = Post.looks("partial_match", params[:word])
    end
  end
end
