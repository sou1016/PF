class Public::MembersController < ApplicationController

  def index
    @member = Member.all
  end

  def show
    @member = Member.find(params[:id])
    @post = @member.post
  end

  def edit
    @member = Member.find(params[:id])
  end

  def update
    @member = Member.find(params[:id])
    if @member.id = current_member.id
      @member.update(member_params)
      redirect_to public_member_path(@member)
    end
  end

  private

  def member_params
    params.require(:member).permit(:name, :profile_image)
  end

end
