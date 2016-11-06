Rails.application.routes.draw do
  scope '/api' do
    resources :shoppers, except: :index do
      resource :basket, except: [:index, :create]
    end
    resources :products
  end
end
