class HomeController < ApplicationController
  def index
    
  end
  
  def is_baddie
    session[:score] ||= 0
    
    unless params[:id] == "null"
      session[:score] += 1
    else
      flash[:got_away] = true
      flash[:address] = Baddy.find(params[:baddy_id]).address
    end
    
    redirect_to root_path
  end
  
  def reset
    session[:score] = 0
    
    redirect_to root_path
  end
end
