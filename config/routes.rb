Rails.application.routes.draw do
  resources :widgets, only: [ :show, :index ]
  resources :widget_ratings, only: [ :create ]

  # Define your application routes per the DSL in https://guides.rubyonrails.org/routing.html

  # Defines the root path route ("/")
  # root "articles#index"

  if Rails.env.development?
    resources :design_system_docs, only: [ :index ]
  end

  ####
  # Custom routes start here

  # For each new custom route:
  #
  # * Besure you have the canonical route declared above
  # * Add the new custom route below the existing OpenStruct* Document why it's needed
  # * Explain anything else non-standard

  # Used in podcast ads for the 'amazing' campaign
  get "/amazing", to: redirect("/widgets")

end
