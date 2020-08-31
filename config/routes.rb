Rails.application.routes.draw do
  root 'venues#index'
  resources :venues do
    get 'platform/:platform_id', to: 'venues#platform_data'
  end
  resources :platforms, only: [:index, :create]
  # For details on the DSL available within this file, see https://guides.rubyonrails.org/routing.html
end
