FlatironKitchen::Application.routes.draw do
  resources :ingredients , :only => [:index, :show, :create, :new, :destroy, :update, :edit]
  resources :recipes , :only => [:index, :show, :create, :new, :destroy, :update, :edit]
end
