require 'csv'

class Baddies < Processing::App

  def setup
    background 0
    size 800, 600
  end

  def draw
    ellipse(56, 46, 55, 55);
  end

  attr_reader :types, :crimes
  
  def load_baddies
    @types  = CSV.read(data_file("data/crime_types.csv"), :headers => true)
    @crimes = CSV.read(data_file("data/crimes.csv"),      :headers => true)
  end
  
  def lat_lng
    data = {
      :lat => {:min  => crimes.first["latitude"].to_f,
               :max  => crimes.first["latitude"].to_f,
               :diff => nil},
      :lng => {:min  => crimes.first["longitude"].to_f,
               :max  => crimes.first["longitude"].to_f,
               :diff => nil}
    }
    
    crimes.each do |row|
      lat = row["latitude"].to_f
      lng = row["longitude"].to_f
      
      data[:lat][:max] = lat if lat > data[:lat][:max]
      data[:lat][:min] = lat if lat < data[:lat][:min]

      data[:lng][:max] = lng if lng > data[:lng][:max]
      data[:lng][:min] = lng if lng < data[:lng][:min]
    end
    
    [:lat,:lng].each {|l| data[l][:diff] = data[l][:max] - data[l][:min]}
    
    @data ||= data
  end
  
  def crime_grid
    grid = []
    
    crimes.each do |row|
      lat = row["latitude"].to_f
      lng = row["longitude"].to_f
      
      x = lat
      y = lng
      
      grid << [row["id"], x, y]
    end
    
    grid
  end
  
  def to_csv
    headers = crimes.headers
    headers << "day_of_week"
    headers << "date"
    headers << "time"
    
    CSV.open("data/baddies.csv", "w") do |csv|
      csv << headers
      crimes.each do |row|
        date = DateTime.parse(row["occurred_at"])
        
        csv << row.fields + [date.wday, date.day, date.strftime("%I:%M %p")]
      end
    end
    
  end
  
  private
  
  def data_file(file)
    File.join(File.expand_path(File.dirname(__FILE__)), file)
  end
end

Baddies.new :title => "Baddies", :width => 800, :height => 600