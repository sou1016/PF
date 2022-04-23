class Public::MembersController < ApplicationController
  before_action :ensure_guest_member, only: [:edit]

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

  def ensure_guest_member
    @member = Member.find(params[:id])
    if @member.name == "guest"
      redirect_to public_member_path(current_member) , notice: 'ゲストユーザーはプロフィール編集、投稿機能は使用できません。'
    end
  end

end
