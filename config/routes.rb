ActionController::Routing::Routes.draw do |map|

  map.root :controller => "seats", :action => "index"
 
  map.resources :seats do |seat|
  end

end
