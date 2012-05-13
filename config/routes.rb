Bolehnego::Application.routes.draw do

  root :to => "welcome#index"

#  devise_for :admins, :path => 'admins/', :class_name => 'Userlogin',
#                          :controllers => {:sessions => 'admin/sessions'} #do
##  
#    root :to => 'admin#overviews'
#  end
                        

#  as :admin do
#    get 'admin/signin' => 'devise/sessions#new', :as => :new_admin_session
#    post 'admin/signin' => 'devise/sessions#create', :as => :admin_session
#    delete 'admin/signout' => 'devise/sessions#destroy', :as => :destroy_admin_session
#  end


devise_for :admin, :class_name => 'User', :controllers => {:sessions => 'admin/sessions'} do
  root :to => 'admin#overviews'
end

#match 'admin/users/:id/updatepriv' => 'users#updatepriv', :via => :put

  namespace :admin do
    resources :overviews
    resources :users do
      put 'changepriv', :on => :member
    end
  end  

  match 'admin/users/:id/changepriv' => 'admin#users#changepriv', :via =>:put

#  root :to => 'welcome#index'
    
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
  # match ':controller(/:action(/:id(.:format)))'
end
