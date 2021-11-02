Rails.application.routes.draw do
  # For details on the DSL available within this file, see https://guides.rubyonrails.org/routing.html
  namespace :api do
    namespace :v1 do
      post '/customers/:customer_id/subscriptions', to: 'customers/subscriptions#create'
      delete '/customers/:customer_id/subscriptions/:id', to: 'customers/subscriptions#destroy'
    end
  end
end
