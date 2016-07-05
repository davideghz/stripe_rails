Rails.application.routes.draw do

  root 'static_pages#home'

  devise_for :users

  resources :charges, only: [:create] do
    collection do
      get :checkoutjs
    end
  end

end
