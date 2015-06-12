Snusnu::Application.routes.draw do
  resources :tables

  resources :mains

  resources :bills

  resources :orders

  resources :clients 

  resources :products do
    collection do
      get 'binding'
    end
  end



  resources :categories

  #get 'categoria/entrada' => 'categories#entrada'
  #get 'categoria/plato' => 'categories#plato'
  #get 'categoria/postre' => 'categories#postre'
  #get 'categoria/bebida' => 'categories#bebida'

  match 'create/order', to: 'orders#dame', via: [:post] # Para crear la orden, Recibo una lista de clientes, un product id y un bill id
  match 'cliente/bill', to: 'orders#porCliente', via: [:post] #para Ver la orden por cliente, recibo un bill id, y un client id
  match 'giff/bill', to: 'bills#creation', via [:post] #Para generar un bill,
 # get 'create/order' => 'orders#dame'
  get 'producto/entrada' => 'products#entrada'
  get 'producto/plato' => 'products#plato'
  get 'producto/postre' => 'products#postre'
  get 'producto/bebida' => 'products#bebida'

  
  # The priority is based upon order of creation: first created -> highest priority.
  # See how all your routes lay out with "rake routes".

  # You can have the root of your site routed with "root"
  root 'clients#new'

  

  # Example of regular route:
  #   get 'products/:id' => 'catalog#view'

  # Example of named route that can be invoked with purchase_url(id: product.id)
  #   get 'products/:id/purchase' => 'catalog#purchase', as: :purchase

  # Example resource route (maps HTTP verbs to controller actions automatically):
  #   resources :products

  # Example resource route with options:
  #   resources :products do
  #     member do
  #       get 'short'
  #       post 'toggle'
  #     end
  #
  #     collection do
  #       get 'sold'
  #     end
  #   end

  # Example resource route with sub-resources:
  #   resources :products do
  #     resources :comments, :sales
  #     resource :seller
  #   end

  # Example resource route with more complex sub-resources:
  #   resources :products do
  #     resources :comments
  #     resources :sales do
  #       get 'recent', on: :collection
  #     end
  #   end

  # Example resource route with concerns:
  #   concern :toggleable do
  #     post 'toggle'
  #   end
  #   resources :posts, concerns: :toggleable
  #   resources :photos, concerns: :toggleable

  # Example resource route within a namespace:
  #   namespace :admin do
  #     # Directs /admin/products/* to Admin::ProductsController
  #     # (app/controllers/admin/products_controller.rb)
  #     resources :products
  #   end
end
