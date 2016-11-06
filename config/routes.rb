Rails.application.routes.draw do
  scope '/api' do
    resources :shoppers, except: :index
    resource :basket, except: [:index, :create]
    resources :products
  end
end
