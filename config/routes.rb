Rails.application.routes.draw do

  root 'static_pages#home'

  devise_for :users

  get 'charges/thanks'

  resources :charges, only: [:create] do
    collection do
      get :checkoutjs
      get :customform
      get :following_purchase
      post :charge_customform
      post :charge_following_purchase
    end
  end

end
