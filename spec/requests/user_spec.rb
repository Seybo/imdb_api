require 'rails_helper'

describe 'Users API', type: :request do
  describe 'GET show' do
    let(:user) { create(:user) }

    context 'when valid request' do
      before { get "/api/v1/profile", headers: valid_headers }

      it 'returns user email' do
        expect(json['email']).to eq(user.email)
      end
    end

    context 'when invalid request' do
      before { get "/api/v1/profile", headers: invalid_headers_with_wrong_token }

      it 'does not return user email' do
        expect(json['email']).to eq nil
      end

      it 'response 401' do
        expect(response).to have_http_status(401)
      end

      it 'returns failure message' do
        expect(json['message']).to match(/Signature verification raised/)
      end
    end
  end

  describe 'POST /signup' do
    let(:user) { build(:user) }
    let(:headers) { valid_headers.except('Authorization') }
    let(:valid_attributes) do
      attributes_for(:user, password_confirmation: user.password)
    end

    context 'when valid request' do
      before { post '/api/v1/signup', params: valid_attributes.to_json, headers: headers }

      it 'creates a new user' do
        expect(User.count).to eq 1
      end

      it 'returns 201' do
        expect(response).to have_http_status(201)
      end

      it 'returns success message' do
        expect(json['message']).to match(/Account created successfully/)
      end

      it 'returns an authentication token' do
        expect(json['auth_token']).not_to be_nil
      end
    end

    context 'when invalid request' do
      # TODO: email format tests
      before { post '/api/v1/signup', params: {}, headers: headers }

      it 'does not create a new user' do
        expect(User.count).to eq 0
      end

      it 'returns 422' do
        expect(response).to have_http_status(422)
      end

      it 'returns failure message' do
        expect(json['message'])
          .to match(/Validation failed: Password can't be blank, Email is invalid, \
Email can't be blank, Name can't be blank, Password digest can't be blank/)
      end
    end
  end
end
