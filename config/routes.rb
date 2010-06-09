SpotTheBaddie::Application.routes.draw do |map|
  root :to => "home#index"

  resource :baddies
end
