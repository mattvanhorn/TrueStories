TrueStories::Application.routes.draw do
  # The priority is based upon order of creation:
  # first created -> highest priority.

  # Sample of regular route:
  match '/auth/:provider/callback' => 'sessions#create'

  # Sample of named route:
  match '/upvote/:story_id' => 'votes#upvote', :as => :upvote
  match '/downvote/:story_id' => 'votes#downvote', :as => :downvote
  match "/sign_up", to: "identities#new", :as => :sign_up
  match "/sign_out", to: "sessions#destroy", :as => :sign_out
  # This route can be invoked with downvote_url(:story_id => story.id)

  # Sample resource route (maps HTTP verbs to controller actions automatically):
  resources :stories, :only => [:index, :new, :create]
  resources :identities, :only => [:new]

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
  root :to => 'stories#index'

  # See how all your routes lay out with "rake routes"

  # This is a legacy wild controller route that's not recommended for RESTful applications.
  # Note: This route will make all actions in every controller accessible via GET requests.
  # match ':controller(/:action(/:id))(.:format)'
end
