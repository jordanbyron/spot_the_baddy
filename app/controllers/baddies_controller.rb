class BaddiesController < ApplicationController
  respond_to :json

  def show
    respond_to do |format|
      format.json do
        render :json => baddy_map.to_json
      end
    end
  end

  # LET'S DO IT ALL IN THE CONTROLLER. WIN!

  def baddy_map
    real_baddy = Baddy.find(:first, :order => "random()").attributes

    imposters = (1..4).map { real_baddy.merge(
      "latitude"  => real_baddy["latitude"] + baddy_fuzz,
      "longitude" => real_baddy["longitude"] + baddy_fuzz,
      :id         => nil) }
  
    real_baddy[:real] = true

    { :baddies => ([real_baddy] + imposters).sort_by { rand } }
  end

  def baddy_fuzz
    rand*0.125*(rand(2) == 1 ? 1 : - 1)
  end
end
