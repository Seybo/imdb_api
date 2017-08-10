class MoviesController < ApplicationController
  before_action :set_movie, only: [:show]

  def show
    json_response @movie
  end

  private

  def set_movie
    @movie = Movie.find(params[:id])
  end
end
