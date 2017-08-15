class V1::Movies::RatingsController < V1::ApplicationController
  before_action :set_movie, only: [:create]

  def create
    Rating.find_or_create_by!(user: @current_user, movie: @movie) do |rating|
      rating.value = params[:rating][:value]
    end

    json_response "Your rating of #{params[:rating][:value]} to movie \"#{@movie.title}\" has been successfully set", :created
  end

  private

  def set_movie
    @movie = Movie.find(params[:movie_id])
  end
end
