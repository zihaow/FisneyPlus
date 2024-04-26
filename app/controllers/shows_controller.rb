class ShowsController < ApplicationController
  def index
    @shows = Show.all
               .by_name(shows_params[:name])
               .by_year(shows_params[:year])
               .by_show_type(shows_params[:show_type])
               .by_genres(shows_params[:genres]&.split(','))
               .by_year_range(shows_params[:start_year], shows_params[:end_year])

    render json: @shows, each_serializer: ShowSerializer
  end

  def show
    show = Show.find_by(id: shows_params[:id])
    return render json: show, serializer: ShowSerializer if show

    render json: { error: 'Show not found' }, status: 404
  end

  private

  def shows_params
    params.permit(:id, :name, :year, :show_type, :genres, :start_year, :end_year)
  end
end