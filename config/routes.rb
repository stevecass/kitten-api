Rails.application.routes.draw do
  resources :cats, except: [:new, :edit]
  resources :breeds, except: [:new, :edit]
  root 'cats#index'
  match '*all' => 'application#cors_options', via: :options
end
