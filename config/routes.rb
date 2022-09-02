Rails.application.routes.draw do

    namespace :api do
      namespace :v1 do
        # resources :books,defaults: {format: :json}
        resources :books do
          member do
            get :order_history
          end
        end
        resources :orders
      end
    end
  # Define your application routes per the DSL in https://guides.rubyonrails.org/routing.html

  # Defines the root path route ("/")
  # root "articles#index"
end
