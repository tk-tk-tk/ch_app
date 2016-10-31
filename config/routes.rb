Rails.application.routes.draw do
  devise_for :users, :controllers => {
  :registrations => 'users/registrations',
  :sessions => 'users/sessions'
  }
  resources :messages do
    resources :comments
  end
  root 'messages#index'
end
