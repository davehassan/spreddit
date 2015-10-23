class SubsController < ApplicationController

  before_action :require_login
  before_action :mod_check, only: [:edit, :update]

  def new
    @sub = Sub.new
    render :new
  end

  def create
    @sub = current_user.moderated_subs.new(sub_params)
    if @sub.save
      redirect_to sub_url(@sub)
    else
      render :new
    end
  end

  def show
    @sub = Sub.find(params[:id])
    render :show
  end

  def edit
    @sub = Sub.find(params[:id])
    render :edit
  end

  def update
    @sub = Sub.find(params[:id])

    if @sub.update(sub_params)
      redirect_to sub_url(@sub)
    else
      render :edit
    end
  end

  private
    def sub_params
      params.require(:sub).permit(:title, :description)
    end

    def mod_check
      sub = Sub.find(params[:id])
      redirect_to sub_url(sub) unless sub.moderator == current_user
    end
end
