Rails.application.routes.draw do
  # For details on the DSL available within this file, see https://guides.rubyonrails.org/routing.html

  # namespace the controllers without affecting the URI

  scope module: :v2, constraints: ApiVersion.new('v2') do
    resources :videos, only: :index
  end




  scope module: :v1, constraints: ApiVersion.new('v1', true) do
    resources :users do
      resources :videos
    end
    resources :videos
  end

  resources :sessions, only: [:create]

  post 'auth/login', to: 'authentication#authenticate'
  get 'auth/signout', to: 'authentication#signout'
  post 'signup', to: 'users#create'
end


