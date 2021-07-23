Rails.application.routes.draw do
  # For details on the DSL available within this file, see https://guides.rubyonrails.org/routing.html
   resources :actors, only: :create do
     collection do
      post 'login'
     end
   end	

   resources :repos, only: :create

   resources :events

   get '/repos/:repo_id/events', to: 'events#get_repo_events'

end
