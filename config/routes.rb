Rails.application.routes.draw do
  scope '/api' do
    namespace :v1 do
      post 'auth/login', to: 'authentication#authenticate'
      post 'signup', to: 'users#create'

      resources :movies, only: [:index, :show, :create] do
        scope module: :movies do
          resource :rating, only: [:create]
        end
      end
    end
  end
end
