# This file should contain all the record creation needed to seed the database with its default values.
# The data can then be loaded with the rake db:seed (or created alongside the db with db:setup).
#
# Examples:
#
#   cities = City.create([{ :name => 'Chicago' }, { :name => 'Copenhagen' }])
#   Mayor.create(:name => 'Daley', :city => cities.first)
#

FasterCSV.foreach("#{RAILS_ROOT}/data/crime_types.csv", :headers => true) do |row|
  Baddygory.create(row.to_hash)
end

FasterCSV.foreach("#{RAILS_ROOT}/data/crimes.csv", :headers => true) do |row|
  params = row.to_hash
  params["baddygory_id"] = params.delete("crime_type_id")
  Baddy.create(params)
end
