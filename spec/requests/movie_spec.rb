require 'rails_helper'
RSpec.describe 'Movies management', type: :request do
  let!(:movies) { create_list(:movie, 10) }
  let(:movie_id) { movies.first.id }
  let(:movie_title) { movies.first.title }


  describe 'GET /movies' do
    before { get "/api/v1/movies" }

    it 'returns all the movies' do
      expect(json.size).to eq 10
    end

    it 'returns status 200' do
      expect(response).to have_http_status :ok
    end
  end


  describe 'GET /movies/:id' do
    before { get "/api/v1/movies/#{movie_id}" }

    context 'when the record exists' do
      it 'returns the movie' do
        expect(json).not_to be_empty
        expect(json['id']).to eq(movie_id)
      end

      it 'returns status code 200' do
        expect(response).to have_http_status :ok
      end
    end

    context 'when the record does not exist' do
      let(:movie_id) { 100 }

      it 'returns status code 404' do
        expect(response).to have_http_status :not_found
      end

      it 'returns a not found message' do
        expect(response.body).to match(/Couldn't find Movie/)
      end
    end
  end


  describe 'POST /movies' do
    let(:valid_attributes) { { title: movie_title } }

    context 'when the record exists' do
      before { post '/api/v1/movies', params: valid_attributes }

      it 'returns the existed movie message' do
        expect(response.body).to match(/Validation failed: Title has already been taken/)
      end

      it 'returns status code 422' do
        expect(response).to have_http_status :unprocessable_entity
      end

      it 'doesnt create a new movie' do
        expect(Movie.count).to eq 10
      end
    end

    context 'when the record does not exist' do
      before { post '/api/v1/movies', params: { title: 'Robocat', rating: 5 } }

      it 'returns status code 201' do
        expect(response).to have_http_status :created
      end

      it 'returns a record created message' do
        expect(response.body).to match(/Your movie "Robocat" has been successfully added/)
      end

      it 'creates a new movie' do
        expect(Movie.count).to eq 11
      end

      it 'sets correct movie title' do
        expect(Movie.last.attributes.extract!('title', 'rating')).to eq("title" => 'Robocat', "rating" => 5)
      end
    end
  end
end
