Rails.application.routes.draw do
  get("/", { :controller => "misc", :action => "homepage" })
  get("/directors", { :controller => "directors", :action => "show_all" })
end
