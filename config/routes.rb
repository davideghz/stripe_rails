Rails.application.routes.draw do

  root 'static_pages#home'

  devise_for :users

  get 'charges/thanks'

  resources :charges, only: [:create] do
    collection do
      get :checkoutjs
      get :customform
      post :charge_customform
      get :charge_customform
    end
  end

end
