Rails.application.routes.draw do
  mount Rswag::Ui::Engine => '/api-docs'
  mount Rswag::Api::Engine => '/api-docs'

  get "up" => "rails/health#show", as: :rails_health_check

  resources :users, only: [:create, :show] do
    resources :plans, only: [:index, :show, :create, :update, :destroy]
  end
end
