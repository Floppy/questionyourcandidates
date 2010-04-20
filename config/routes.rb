ActionController::Routing::Routes.draw do |map|

  map.root :controller => "main", :action => "index"
  map.search "/search", :controller => "main", :action => "search"
 
  map.resources :seats do |seat|
    seat.resources :events
  end

end
