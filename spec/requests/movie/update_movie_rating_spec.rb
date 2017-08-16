require 'rails_helper'

describe 'POST /ratings UpdateMovieRating', type: :request do
  let(:user1) { create(:user) }
  let(:user2) { create(:user) }
  let(:user3) { create(:user) }
  let(:headers1) { { "Authorization" => token_generator(user1.id), "Content-Type" => "application/json" } }
  let(:headers2) { { "Authorization" => token_generator(user2.id), "Content-Type" => "application/json" } }
  let(:headers3) { { "Authorization" => token_generator(user3.id), "Content-Type" => "application/json" } }

  let!(:movie) { create :movie }

  it 'updates average' do
    post "/api/v1/movies/#{movie.id}/rating", params: { value: 2 }.to_json, headers: headers1
    post "/api/v1/movies/#{movie.id}/rating", params: { value: 5 }.to_json, headers: headers2
    post "/api/v1/movies/#{movie.id}/rating", params: { value: 3 }.to_json, headers: headers3

    movie.reload
    expect(movie.rating).to eq 3.33
  end
end
