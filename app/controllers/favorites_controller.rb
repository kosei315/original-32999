class FavoritesController < ApplicationController
  def create
    @favorite = current_user.favorites.create(travel_id: params[:travel_id])
    redirect_back(fallback_location: root_path)
  end

  def destroy
    @travel = Travel.find(params[:travel_id])
    @favorite = current_user.favorites.find_by(travel_id: @travel.id)
    @favorite.destroy
    redirect_back(fallback_location: root_path)
  end
end
