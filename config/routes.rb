Rails.application.routes.draw do
  # For details on the DSL available within this file, see http://guides.rubyonrails.org/routing.html
  resources :achievement, only: %w(new create show)
  root to: 'welcome#index'
end
