Rainforest::Application.routes.draw do
  root "products/" => "products#index"
  resources :products
end
