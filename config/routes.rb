Rails.application.routes.draw do
  scope '/api' do
    namespace :v1 do
      resources :movies, only: [:index, :show, :create] do
        get 'rating', on: :member
      end
    end
  end
end
