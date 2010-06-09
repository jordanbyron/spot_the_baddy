class Baddy < ActiveRecord::Base
  belongs_to :baddygory
  
  def to_hash
    {
      :id => id,
      :occurred_at => occurred_at,
      :address => address,
      :latitude => latitude,
      :longitude => longitude,
      :baddygory => baddygory.name,
    }
  end
end
