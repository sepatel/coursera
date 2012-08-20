Rottenpotatoes::Application.routes.draw do
  match '/movies/director', :controller => 'movies', :action => 'director'
  resources :movies
  #match '/movies/director/:director', to => 'movies#director'
  # map '/' to be a redirect to '/movies'
  root :to => redirect('/movies')
end
