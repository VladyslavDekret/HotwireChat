Rails.application.routes.draw do
  devise_for :users, controllers: { registrations: "registrations" }

  resources :users, only: %i[show edit update]
  resources :rooms, only: %i[show create], param: :title
  resources :messages, only: :create do
    member { post :like }
  end

  root "rooms#index"
end
