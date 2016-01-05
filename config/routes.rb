Rails.application.routes.draw do
  resources :cats, except: [:new, :edit]
  resources :breeds, except: [:new, :edit]
  root 'cats#index'
end
