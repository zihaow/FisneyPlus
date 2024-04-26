class FavoritesController < ApplicationController
  def create
    if current_show
      current_user.shows << @current_show
      render json: { message: "Show #{current_show.name} favorited" }
    else
      render_error("Show not found", 404)
    end
  rescue ActiveRecord::RecordInvalid => err
    render_error(err, 400)
  end

  private

  def current_show
    @current_show ||= Show.find_by(id: favorites_params[:id])
  end

  def favorites_params
    params.require(:show).permit(:id)
  end
end