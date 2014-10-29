Rails.application.routes.draw do
  root 'session#new'
  post '/session' => 'session#create'
  delete '/session' => 'session#destroy'
  resources :user
  resources :group
  resources :game
  resources :user_group

#        Prefix Verb   URI Pattern               Controller#Action
#        root GET    /                         session#new
#       login GET    /login(.:format)          session#new
#     session POST   /session(.:format)        session#create
#             DELETE /session(.:format)        session#destroy
#  user_index GET    /user(.:format)           user#index
#             POST   /user(.:format)           user#create
#    new_user GET    /user/new(.:format)       user#new
#   edit_user GET    /user/:id/edit(.:format)  user#edit
#        user GET    /user/:id(.:format)       user#show
#             PATCH  /user/:id(.:format)       user#update
#             PUT    /user/:id(.:format)       user#update
#             DELETE /user/:id(.:format)       user#destroy
# group_index GET    /group(.:format)          group#index
#             POST   /group(.:format)          group#create
#   new_group GET    /group/new(.:format)      group#new
#  edit_group GET    /group/:id/edit(.:format) group#edit
#       group GET    /group/:id(.:format)      group#show
#             PATCH  /group/:id(.:format)      group#update
#             PUT    /group/:id(.:format)      group#update
#             DELETE /group/:id(.:format)      group#destroy
#  game_index GET    /game(.:format)           game#index
#             POST   /game(.:format)           game#create
#    new_game GET    /game/new(.:format)       game#new
#   edit_game GET    /game/:id/edit(.:format)  game#edit
#        game GET    /game/:id(.:format)       game#show
#             PATCH  /game/:id(.:format)       game#update
#             PUT    /game/:id(.:format)       game#update
#             DELETE /game/:id(.:format)       game#destroy
  # The priority is based upon order of creation: first created -> highest priority.
  # See how all your routes lay out with "rake routes".

  # You can have the root of your site routed with "root"
  # root 'welcome#index'

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
