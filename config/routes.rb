SpotTheBaddie::Application.routes.draw do |map|
  root :to => "home#index"

  resource :baddies
  
  match '/is_baddie/:id' => "home#is_baddie"
end
