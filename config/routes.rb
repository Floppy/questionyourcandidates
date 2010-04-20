ActionController::Routing::Routes.draw do |map|

  map.root :controller => "seats", :action => "index"
 
  map.resources :seats do |seat|
    seat.resources :events
  end

end
