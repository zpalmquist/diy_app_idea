# This file should contain all the record creation needed to seed the database with its default values.
# The data can then be loaded with the rails db:seed command (or created alongside the database with db:setup).
#
# Examples:
#
#   movies = Movie.create([{ name: 'Star Wars' }, { name: 'Lord of the Rings' }])
#   Character.create(name: 'Luke', movie: movies.first)
require 'csv'
require 'pry'


Country.create!(name:"Turkey")
AdministrativeArea.create!(name:"CO", country:Country.first)
u = User.new(username:"tom",email:"tom@tom.com")
u.save!(:validate => false)
Locality.create(administrative_area:AdministrativeArea.first)
Band.create(genre:"slitterstunk", name:"muzzlepits",locality:Locality.first )
UserBand.create(user:User.first, band:Band.first)
Venue.create(name:"clubadub", locality:Locality.first)
UserVenue.create(user:User.first, venue:Venue.first)
Event.create(start_date:"4/5/208", end_date:"4/5/2018", start_time:"4/5/2018", end_time:"4/5/3028", venue: Venue.first)

# CSV.foreach('app/data/seed_data/countries.csv', :headers => true) do |row|
#   Country.create!(
#     name: row["name"],

#   )
# end

# CSV.foreach('app/data/seed_data/administrative_areas.csv', :headers => true) do |row|
#   AdministrativeArea.create!(
#     name: row["name"],
#     country_id: row["country_id"]
#     )
#     binding.pry
# end


# CSV.foreach('app/data/seed_data/band_events.csv'
#   ) do |row|
#     BandEvent.create!(
#       band_id: row[:band_id],
#       event_id: row[:event_id]
#     )
#   end

#   CSV.foreach('app/data/seed_data/bands.csv'
#     ) do |row|
#       Band.create!(
#         genre: row[:genre],
#         locality_id: row[:locality_id],
#         name: row[:name]
#       )
#     end

#   CSV.foreach('app/data/seed_data/countries.csv'
#     ) do |row|
#       Country.create!(
#         name: row[:name]
#       )
#     end

#   CSV.foreach('app/data/seed_data/events.csv'
#     ) do |row|
#       Event.create!(
#         start_date: row[:start_date],
#         end_date: row[:end_date],
#         start_time: row[:start_time],
#         end_time: row[:end_time],
#         venue_id: row[:venue_id],
#         title:    row[:title]
#       )
#     end

#   CSV.foreach('app/data/seed_data/localities.csv'
#     ) do |row|
#       Locality.create!(
#         name: row[:name],
#         administrative_area_id: row[:administrative_area_id]
#       )
#     end

#   CSV.foreach('app/data/seed_data/venue_events.csv'
#     ) do |row|
#       VenueEvent.create!(
#         venue_id: row[:venue_id],
#         event_id: row[:event_id]
#       )
#     end

#   CSV.foreach('app/data/seed_data/venues.csv'
#     ) do |row|
#       Venue.create!(
#         name: row[:name],
#         locality_id: row[:locality_id]
#       )
#       puts 'Venue created'
#     end
