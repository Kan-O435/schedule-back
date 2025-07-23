Rails.application.routes.draw do
  mount Rswag::Ui::Engine => '/api-docs'
  mount Rswag::Api::Engine => '/api-docs'

  get "up" => "rails/health#show", as: :rails_health_check

  resources :users, only: [:create, :show] do
    resources :plans, only: [:index, :show, :create, :update, :destroy]
    get 'shared_plans', to: 'share_plans#shared'
  end

  resources :share_plans, only: [:create] do
    collection do
      delete '/', to: 'share_plans#destroy', as: :destroy
    end
  end
end
