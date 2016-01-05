Rails.application.routes.draw do
  resources :cats, except: [:new, :edit]
  root 'cats#index'
end
