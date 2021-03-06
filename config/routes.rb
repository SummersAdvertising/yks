Yks::Application.routes.draw do
  resources :knack_categories do
  	resources :knacks
  end

  namespace :admin do
  
  	match ':_controller(/:_id)/images'		=> 'images#index'
  	match ':_controller(/:_id)/destroy'		=> 'images#destroy'
    match '/knack_categories/:knack_category_id/knacks/:id/createphoto' 			=> 'knack_photos#create', :via => [:post]    
    resources :defines
    resources :system_site_maps
    resources :services
    resources :service_types
    resources :news
    resources :images
    resources :user_exps
    resources :banners
    resources :tickets
    resources :ticket_types
    resources :users
    resources :photos
    resources :knack_categories do
    	resources :knacks do
    		resources :knack_photos
    	end
    end
    
    match 'login' => 'login#index'
    match 'login/login' => 'login#login'
    match 'logout' => 'login#logout'
    match 'change' => 'users#change'
    match 'changepw' => 'users#changepw'
    match 'uploadimage' => 'news#uploadimage'    
    
  end
  
  
  match 'contact' => 'contact#new'
  
  match 'page-(:id).html' => 'system#content'
  
  resources :system_site_maps
  resources :user_exps
  resources :services
  resources :banners
  resources :photos
  
  match 'page/:pagename' => 'system_site_maps#show'

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
  
  
  match ':controller(/:action(/:id))(.:format)'
  
  root :to => 'system_site_maps#index'
  
end