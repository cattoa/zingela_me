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

json = File.read("#{Rails.root}/db/zingela_companies.json")
puts "--------------------- Companies-------------------------------------------"
ActiveSupport::JSON.decode(json)["companies"].each do |fd|
  puts fd["id"]
  Company.where(:id => fd["id"]).first_or_create(
    :company_name => fd["company_name"],
    :email => fd["email"],
    :password => "Qwerty1!"
  )
  Company.update(
    fd["id"],
    :company_name => fd["company_name"],
    :email => fd["email"],
    :password => "Qwerty1!"
  )
end

Project.delete_all()
json = File.read("#{Rails.root}/db/zingela_projects.json")
puts "--------------------- Projects-------------------------------------------"
ActiveSupport::JSON.decode(json)["projects"].each do |fd|
  puts fd["id"]
  Project.where(:id => fd["id"]).first_or_create(
    :name => fd["name"],
    :start_date => fd["start_date"],
    :expected_delivery_date => fd["expected_delivery_date"],
    :actual_delivery_date => fd["actual_delivery_date"],
    :active => fd["active"],
    :user_id => fd["user_id"],
    :company_id => fd["company_id"]
  )
end
FieldDatum.delete_all()
json = File.read("#{Rails.root}/db/zingela_field_data.json")
puts "--------------------- Field Data-------------------------------------------"

ActiveSupport::JSON.decode(json)["field_data"].each do |fd|
  puts fd["id"]
  FieldDatum.where(:id => fd["id"]).first_or_create(
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
  )
end


Observation.delete_all()
json = File.read("#{Rails.root}/db/zingela_observations.json")
puts "--------------------- Observations-------------------------------------------"

ActiveSupport::JSON.decode(json)["observations"].each do |fd|
  puts fd["id"]
  Observation.where(:id => fd["id"]).first_or_create(
  :notes => fd["notes"],
  :field_datum_id => fd["field_datum_id"],
  :species_id => fd["species_id"]
  )
end

Community.delete_all()
json = File.read("#{Rails.root}/db/zingela_communities.json")
puts "--------------------- Communities-------------------------------------------"

ActiveSupport::JSON.decode(json)["communities"].each do |fd|
  puts fd["id"]
  Community.where(:id => fd["id"]).first_or_create(
  :description => fd["description"],
  :project_id => fd["project_id"],
  )
end

CrownDiameter.delete_all()
json = File.read("#{Rails.root}/db/zingela_crown_diameters.json")
puts "--------------------- Crown Diameter -------------------------------------------"

ActiveSupport::JSON.decode(json)["crown_diameters"].each do |fd|
  puts fd["id"]
  CrownDiameter.where(:id => fd["id"]).first_or_create(
  :observation_id => fd["observation_id"],
  :lower_crown_diameter => fd["lower_crown_diameter"],
  :upper_crown_diameter => fd["upper_crown_diameter"],
  :transect_length => fd["transect_length"],
  :code => fd["code"],
  )
end

json = File.read("#{Rails.root}/db/zingela_growth_forms.json")
puts "--------------------- Growth Form -------------------------------------------"

GrowthForm.delete_all()
ActiveSupport::JSON.decode(json)["growth_forms"].each do |fd|
  puts fd["id"]
  GrowthForm.where(:id => fd["id"]).first_or_create(
  :observation_id => fd["observation_id"],
  :description => fd["description"],
  :code => fd["code"],
  :order => fd["order"],
  )
end

PlantCover.delete_all()
json = File.read("#{Rails.root}/db/zingela_plant_covers.json")
puts "--------------------- Plant Cover -------------------------------------------"

ActiveSupport::JSON.decode(json)["plant_covers"].each do |fd|
  puts fd["id"]
  PlantCover.where(:id => fd["id"]).first_or_create(
  :observation_id => fd["observation_id"],
  :code => fd["code"],
  :upper_class_limit => fd["upper_class_limit"],
  :lower_class_limit => fd["lower_class_limit"],
  :class_interval => fd["class_interval"],
  :percentage => fd["percentage"],
  )
end
