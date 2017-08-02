FlatironKitchen::Application.routes.draw do
  resources :ingredients, only: [:new, :create, :edit, :update, :show]
  resources :recipes, only: [:new, :create, :show, :edit, :update]
end
