Rails.application.routes.draw do
  scope '/api' do
    scope '/v1' do
      resources :movies, only: [:index, :show, :create]
    end
  end
end
