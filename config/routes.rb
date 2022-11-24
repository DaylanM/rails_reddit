Rails.application.routes.draw do
  # Define your application routes per the DSL in https://guides.rubyonrails.org/routing.html

  # Defines the root path route ("/")
  # root "articles#index"

  # http verb - how the browser communicates the crud actions
  # Create -> POST
  # Read -> GET
  # Update -> PUT / PATCH
  # Destroy -> DELETE

  # rails this file does navigation
  # rails with react, lead us somewhere in our controller
  # table of content

  # manually, custom function
  # http verb, to: 'controller(s)#action'
  # get '/subs/', to: 'subs#index'
  # get '/subs/:id', to: 'subs#show'
      # :id -> placeholder
        # /subs/23
  # post '/subs/', to: 'subs#create'
  # put '/subs/', to: 'subs#update'
  # delete '/subs/', to: 'subs#destroy'

  # resources :controller(s)
  # resources :controller :subs, only: [:show, :create]
  # resources :controller :subs, except: [:index, :update]


  namespace :api do
    resources :subs do
      resources :topics
    end
  end

  # if there is another model and is a child of this model then the routes would be embedded routes

  #   resources :parent(s) do
  #     resources :child(s)
  #   end

  # only two levels deep, any more will be too complicated

  ### don't do this
  #   resources :parent(s) do
  #     resources :child(s)
  #       resources :grandchild(s)
  #         resources :grandgrandchild(s)
  #   end


  #   resources :parent(s) do
  #     resources :child(s)
  #   end

  # this creates duplicate routes for the child
  #   resources :child(s) except : [:index, :show, :create, :update, :destroy] do
  #     resources :grandchild(s)
  #   end






end
