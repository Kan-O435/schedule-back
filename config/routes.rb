Rails.application.routes.draw do
  mount Rswag::Ui::Engine => '/api-docs'
  mount Rswag::Api::Engine => '/api-docs'

  get "up" => "rails/health#show", as: :rails_health_check
  resources :users, only: [:index]

  resources :users, only: [:index, :create, :show] do
    resources :plans, only: [:index, :show, :create, :update, :destroy]

    get 'shared_events', to: 'shared_plans#index'
  end

  resources :share_plans, only: [:create] do
    collection do
      delete '/', to: 'shared_plans#destroy', as: :destroy
    end
  end
end
