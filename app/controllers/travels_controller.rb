class TravelsController < ApplicationController
  before_action :authenticate_user!, only: [:index,:show,:new,:create,:edit,:update,:destroy]
  def index
    @travels = Travel.all.order("created_at DESC")
  end

  def show
    @travel = Travel.find(params[:id])
  end

  def new
    @travel = Travel.new
  end

  def create
    @travel = Travel.new(travel_params)
    @travel.user_id = current_user.id
    if @travel.save
    redirect_to travel_path(@travel), notice: '投稿に成功しました'
    else
      render :new
    end
  end


  def edit
    @travel = Travel.find(params[:id])
    if @travel.user != current_user
      redirect_to travals_path, alert: '不正なアクセスです'
    end
  end

  def update
    @travel = Travel.find(params[:id])
    if @travel.update(travel_params)
    redirect_to travel_path(@travel), notice: '更新に成功しました'
    else
      render :edit
    end
  end

  def destroy
    travel = Travel.find(params[:id])
    travel.destroy
    redirect_to travels_path
  end


  private
  def travel_params
    params.require(:travel).permit(:title, :body, :image, :comment)
  end
end
