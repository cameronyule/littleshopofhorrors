Rails.application.routes.draw do
  scope '/api' do
    resources :products
    resources :shoppers, except: :index do
      resource :basket, except: [:index, :create]
      post 'checkout', to: 'checkout#checkout'
    end
  end
end
