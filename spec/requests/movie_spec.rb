require 'rails_helper'

describe 'Movies management', type: :request do
  let!(:movies) { create_list(:movie, 10) }
  let(:movie_id) { movies.first.id }

  describe 'GET /movies/:id' do
    before { get "/api/v1/movies/#{movie_id}" }

    context 'when the record exists' do
      it 'returns the movie' do
        binding.pry
        expect(json).not_to be_empty
        expect(json['id']).to eq(movie_id)
      end

      it 'returns status code 200' do
        expect(response).to have_http_status(200)
      end
    end
  end
end
