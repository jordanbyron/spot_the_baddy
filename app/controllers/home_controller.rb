class HomeController < ApplicationController
  def index
    
  end
  
  def is_baddie
    session[:score] ||= 0
    
    unless params[:id] == "null"
      session[:score] += 1000000
    end
    
    redirect_to root_path
  end
end
