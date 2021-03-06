
Rails.application.routes.draw do
  # For details on the DSL available within this file, see http://guides.rubyonrails.org/routing.html
  # mount GrapeSwaggerRails::Engine => '/swagger'
  # mount Api::NotFoundApi => '/'

  get    '/signup',  to: 'users#new'
  post   '/signup',  to: 'users#create'
  get    '/login',   to: 'sessions#new'
  post   '/login',   to: 'sessions#create'
  delete '/logout',  to: 'sessions#destroy'
  get    '/dashboard', to: 'dashboard#index'
  get    '/facebook_redirect', to: 'sessions#facebook_redirect'
end
