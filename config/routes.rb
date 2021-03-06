TmunApp::Application.routes.draw do


  get '/branches/hconferences/:id/speakers', to: 'hconference#speakers'
  get '/branches/cconferences/:id/speakers', to: 'cconference#speakers'

  get '/branches/hconferences/:id/manage-speakers', to: 'speakers#index'
  get '/branches/cconferences/:id/manage-speakers', to: 'speakers#index'

  resources :deadlines

  resources :trainings

  resources :headlines

  resources :topics

  resources :branches do
    resources :schedules
    resources :headlines

  end
  resources :cconferences do
    resources :faqs
    resources :schedules
    resources :topics
    resources :deadlines
    resources :speakers, except: :index

    member do
      get 'locations'
      get 'committees'
      get 'speakers'
      get 'register'
    end
  end
  resources :tconferences

  resources :hconferences do
    resources :faqs
    resources :schedules
    resources :topics
    resources :deadlines
    resources :speakers, except: :index

    member do
      get 'locations'
      get 'committees'
      get 'speakers'
      get 'position_papers'
      get 'research'
      get 'register'
    end
  end

  resources :schedules

  resources :badges

  resources :users do
    resources :badges
  end
  resources :frontpages


  resources :sessions, only: [:new, :create, :destroy]
  resources :microposts, only: [:create, :destroy]

  resources :questions

  root 'static_pages#home'

  match '/admintools/frontpages', to: 'frontpages#index', via: 'get'

  match '/_update_frontpage', to: 'frontpages#update_frontpage', via: 'put'
  match '/_update_training_schedule', to: 'branches#update_training_schedule', via: 'put'
  match '/_update_letter', to: 'branches#update_letter', via: 'put'
  match '/_update_hello', to: 'frontpages#update_hello', via: 'put'
  match '/branches/travelteam/guides/', to: 'static_pages#guides', via: 'get'
  match '/letter/', to: 'branches#letter', via: 'get'
  match '/training_schedule/', to: 'branches#training_schedule', via: 'get'
  match '/branches/travelteam/training/', to: 'static_pages#training', via: 'get'
  match '/branches/travelteam/upcoming/', to: 'static_pages#upcoming', via: 'get'
  match '/branches/travelteam/resources/', to: 'static_pages#resources', via: 'get'
  match '/branches/travelteam/past/', to: 'static_pages#past', via: 'get'
  match '/branches/tritonmun/staff/', to: 'static_pages#staff', via: 'get'

  match '/admintools',  to: 'users#admintools',         via: 'get'

  match '/tritonmun/:number',  to: 'hconferences#show',         via: 'get'

  match '/tritonmun/all',  to: 'hconferences#all',         via: 'get'





  match '/signup',  to: 'users#new',              via: 'get'
  match '/signin',  to: 'sessions#new',         via: 'get'
  match '/signout', to: 'sessions#destroy',     via: 'delete'

  # match '/tritonmun/new',  to: 'hconferences#create',         via: 'get'
  #match '/tritonmun/all',  to: 'hconferences#index',         via: 'get'
  # match '/tritonmun/:number',  to: 'hconferences#show',         via: 'get'

  match '/app',    to: 'static_pages#app',    via: 'get'

  match '/x',    to: 'static_pages#x',    via: 'get'
  match '/commitees',    to: 'static_pages#commitees',    via: 'get'
  match '/staff',    to: 'static_pages#staff',    via: 'get'
  match '/register',    to: 'static_pages#register',    via: 'get'


  match '/admintools/conferences',    to: 'static_pages#conferences',    via: 'get'
  match '/travelteam',    to: 'static_pages#travelteam',    via: 'get'
  match '/about',   to: 'static_pages#about',   via: 'get'

  match '/tritonmun/new/#',   to: 'hconferences#add_question',   via: 'get'

  match '/participate',   to: 'static_pages#participate',   via: 'get'

  match '/mission',   to: 'static_pages#mission',   via: 'get'
  match '/secretariat',   to: 'static_pages#secretariat',   via: 'get'
  match '/history',   to: 'static_pages#history',   via: 'get'
  match '/alumni',   to: 'static_pages#alumni',   via: 'get'

  match '/calendar',   to: 'static_pages#calendar',   via: 'get'

  match '/hconference/all', to: 'hconferences#all', via: 'get'


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
