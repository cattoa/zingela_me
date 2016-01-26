# This file should contain all the record creation needed to seed the database with its default values.
# The data can then be loaded with the rake db:seed (or created alongside the db with db:setup).
#
# Examples:
#
#cities = City.create([{ name: 'Chicago' }, { name: 'Copenhagen' }])
#Mayor.create(name: 'Emanuel', city: cities.first)
#admin = Admin.new
#admin.email = 'murraycatto@live.co.za'
#admin.password = 'Password123'
#admin.password_confirmation = 'Password123'
#admin.save!


# admin = Admin.new
# admin.email = 'allistair@bobcatt.co.za'
# admin.password = 'Qwerty1!'
# admin.password_confirmation = 'Qwerty1!'
# admin.save!

File.open("#{Rails.root}/db/Species.csv", "r") do |f|
  f.each_line do |line|
    species = line.split("|")

      species.each do
          SpeciesFamily.where(:name => species[0]).first_or_create
          Species.where(
          :species_family_id => SpeciesFamily.find_by_name(species[0]),
          :potential_biomass => species[1],
          :species => species[2],
          :name => species[2],
          :threat_status => species[3],
          :sysnonym_of => species[5],
          :sa_endemic => species[4],
          :common_name => species[6],
          :life_cycle => species[7],
          :growth_forms => species[8],
          :max_height => species[10],
          :min_hieght => species[9],
          :min_altitude => species[11],
          :max_altitude => species[12],
          :distribution => species[13]
          ).first_or_create
      end
  end
end

require 'rubygems'
require 'json'


json = File.read("#{Rails.root}/db/zingela_data.json")

ActiveSupport::JSON.decode(json)["field_data"].each do |fd|
  puts fd["id"]
  FieldDatum.where(
    :id => fd["id"],
    :date => fd["date"],
  	:location => fd["location"],
  	:latitude_degree => fd["latitude_degree"],
  	:longitude_degree => fd["longitude_degree"],
  	:habitat_description => fd["habitat_description"],
  	:project_id => fd["project_id"],
  	:scale => fd["scale"],
  	:releve_number => fd["releve_number"],
  	:observer => fd["observer"],
  	:community_id => fd["community_id"],
  	:longitude_seconds => fd["longitude_seconds"],
  	:latitude_seconds => fd["latitude_seconds"],
  	:latitude_minutes => fd["latitude_minutes"],
  	:longitude_minutes => fd["longitude_minutes"]
  ).first_or_create
end
