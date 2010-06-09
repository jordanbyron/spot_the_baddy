class HomeController < ApplicationController
  def index
    
  end
  
  def is_baddie
    session[:score] ||= 0
    
    flash[:baddy_info] = Baddy.find(params[:baddy_id])
    
    unless params[:id] == "null"
      session[:score] += 1
      flash[:got_away] = false
    else
      flash[:got_away] = true
    end
    
    redirect_to root_path
  end
  
  def reset
    session[:score] = 0
    
    redirect_to root_path
  end
  
  def musics
    
  end
end
