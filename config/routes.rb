Brz3::Application.routes.draw do

  resources :orbits


  resources :blog_categories

  resources :blog_posts do
    resources :blog_comments
  end
  
  resources :blog_comments

  resources :blog, :controller => 'blog_posts'
  
  match "blog_comments/moderate/:id" => "blog_comments#moderate"

  resources :quotes

  resources :links

  resources :tags

  devise_for :users

  devise_scope :user do
    get "/login" => "devise/sessions#new"
  end

  resources :users do
    member do
      get 'toggle_view'
    end
  end

  resources :uploads

  resources :twitter_boards

  resources :images

  resources :videos

  resources :templates

  resources :pages do
    resources :sections
  end

  resources :sections do
    resources :rows
  end

  resources :rows do
    resources :columns
  end

  resources :columns do
    resources :blocks
  end

  match "made/:id", :to => "pages#show"

  match "portfolio" => "portfolio#index"
  match "portfolio/all" => "portfolio#all"
  match "portfolio/tag/:tag_id" => "portfolio#show_tag", :as => :portfolio_show_tag

  resources :contacts

  root :to => 'portfolio#index'

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
