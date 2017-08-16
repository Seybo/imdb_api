class UpdateMovieRating
  attr_reader :movie

  def call
    movie.update(rating: average_rating)
  end

  def initialize(movie)
    @movie = movie
  end

  private

  def average_rating
    Rating.where(movie: movie).average(:value).to_f.round(2)
  end
end
