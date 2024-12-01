Rails.application.routes.draw do
  get("/", { :controller => "misc", :action => "homepage" })
  get("/directors", { :controller => "directors", :action => "show_all" })
  get("/directors/youngest", { :controller => "directors", :action => "youngest" })
  get("/directors/eldest", { :controller => "directors", :action => "oldest" })
  get("/directors/:id", { :controller => "directors", :action => "show_director" })
  get("/movies", { :controller => "movies", :action => "show_all" })
  get("/movies/:id", { :controller => "movies", :action => "show_movie" })
  get("/actors", { :controller => "actors", :action => "show_all" })
  get("/actors/:id", { :controller => "actors", :action => "show_actor" })
end
