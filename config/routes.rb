Rails.application.routes.draw do
  get '/resorts', to: "resorts#index", as: 'resorts'
  get '/resorts/:slug', to: "resorts#show", as: 'resort'

  get 'resorts/:resort_slug/:slug', to: "parks#show", as: 'park'

  get 'resorts/:resort_slug/:park_slug/attractions/:slug', to: "attractions#show", as: 'attraction'
  get 'resorts/:resort_slug/:park_slug/entertainments/:slug', to: "entertainments#show", as: 'entertainment'
  # For details on the DSL available within this file, see http://guides.rubyonrails.org/routing.html
end
