require 'rails_helper'

describe 'Rating management', type: :request do
  let(:user) { create(:user) }
  let!(:movie) { create :movie }

  describe 'POST /rating' do
    context 'when the movie does not exists' do
      before { post "/api/v1/movies/999/rating", headers: valid_headers }

      it 'returns movie not found message' do
        expect(response.body).to match(/Couldn't find Movie with 'id'=999/)
      end

      it 'returns status code 422' do
        expect(response).to have_http_status :not_found
      end
    end

    context 'when the movie exists' do
      before { post "/api/v1/movies/#{movie.id}/rating", params: { value: 5 }.to_json, headers: valid_headers }

      it 'returns status code 201' do
        expect(response).to have_http_status :created
      end

      it 'sets the rating' do
        expect(Rating.where(user: user, movie: movie).count).to eq 1
      end

      it 'doesnt create a new record if rating exists' do
        post "/api/v1/movies/#{movie.id}/rating", params: { value: 3 }.to_json, headers: valid_headers
        expect(Rating.where(user: user, movie: movie).count).to eq 1
      end

      it 'returns rating successfully set message' do
        expect(response.body).to match(/Your rating of 5 to movie \"#{movie.title}\" has been successfully set/)
      end
    end
  end
end
