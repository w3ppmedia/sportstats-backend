Rails.application.routes.draw do
  resources :teams
  # For details on the DSL available within this file, see http://guides.rubyonrails.org/routing.html
  root 'teams#index'

  mount ResqueWeb::Engine => '/resque'
end
