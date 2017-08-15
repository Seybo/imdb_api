class V1::MoviesController < V1::ApplicationController
  before_action :set_movie, only: [:show, :rating]
  skip_before_action :authorize_request, only: [:index, :show]

  def index
    json_response Movie.all
  end

  def show
    json_response @movie
  end

  def create
    Movie.create!(movie_params)
    json_response "Your movie \"#{params[:title]}\" has been successfully added", :created
  end

  def rating
    json_repsonse @movie.rating
  end

  private

  def set_movie
    @movie = Movie.find(params[:id])
  end

  def movie_params
    params.permit(:title, :rating)
  end
end
