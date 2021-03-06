BidmcInitech::Application.routes.draw do
  resources :ctas do
    member do
      get 'document'
      post 'add_form'
      post 'set_status'
      post 'add_ci'
      post 'add_cci'
      post 'remove_ci'
      post 'remove_cci'
      post 'upload'
    end
    collection do
      post 'search'
      get  'search'
    end
  end

  resources :user_groups

  resources :notifications do
    collection do
      post 'generate_dep_rep_notification'
      post 'generate_status_update_notification'
    end
  end

  resources :forms do
    member do 
      put 'edit'
      post 'check_in'
      post 'check_out'
      get 'printable'
      post 'add_note'
      post 'version_revert'
      get 'send_to_rep'
    end
  end

  resources :users do
    collection do
      post 'search'
      get  'search'
    end
  end

  match 'application/log_in' => 'application#log_in'
  match 'application/log_out' => 'application#log_out'

  root :to => 'ctas#index'

  # The priority is based upon order of creation:
  # first created -> highest priority.

  # Sample of regular route:
  #   match 'products/:id' => 'catalog#view'
  # Keep in mind you can assign values other than :controller and :action

  # Sample of named route:
  #   match 'products/:id/purchase' => 'catalog#purchase', :as => :purchase
  # This route can be invoked with purchase_url(:id => product.id)

  # Sample resource route (maps HTTP verbs to controller actions automatically):
  #   resources :products

  # Sample resource route with options:
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

  # Sample resource route with sub-resources:
  #   resources :products do
  #     resources :comments, :sales
  #     resource :seller
  #   end

  # Sample resource route with more complex sub-resources
  #   resources :products do
  #     resources :comments
  #     resources :sales do
  #       get 'recent', :on => :collection
  #     end
  #   end

  # Sample resource route within a namespace:
  #   namespace :admin do
  #     # Directs /admin/products/* to Admin::ProductsController
  #     # (app/controllers/admin/products_controller.rb)
  #     resources :products
  #   end

  # You can have the root of your site routed with "root"
  # just remember to delete public/index.html.
  # root :to => 'welcome#index'

  # See how all your routes lay out with "rake routes"

  # This is a legacy wild controller route that's not recommended for RESTful applications.
  # Note: This route will make all actions in every controller accessible via GET requests.
  # match ':controller(/:action(/:id))(.:format)'
end
