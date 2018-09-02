# This file should contain all the record creation needed to seed the database with its default values.
# The data can then be loaded with the rails db:seed command (or created alongside the database with db:setup).
#
# Examples:
#
#   movies = Movie.create([{ name: 'Star Wars' }, { name: 'Lord of the Rings' }])
#   Character.create(name: 'Luke', movie: movies.first)
require 'csv'
CSV.readlines('app/data/seed_data/administrative_areas.csv',{ headers: true,
                                                              header_converters: :symbol }
                                                              ) do |row|
  AdministrativeArea.create!(
    name: row[:name],
    country_id: row[:country_id]
  )
end

CSV.readlines('app/data/seed_data/band_events.csv',{ headers: true,
  header_converters: :symbol }
  ) do |row|
    BandEvent.create!(
      band_id: row[:band_id],
      event_id: row[:event_id]
    )
  end

  CSV.readlines('app/data/seed_data/bands.csv',{ headers: true,
    header_converters: :symbol }
    ) do |row|
      Band.create!(
        genre: row[:genre],
        locality_id: row[:locality_id],
        name: row[:name]
      )
    end

  CSV.readlines('app/data/seed_data/countries.csv',{ headers: true,
    header_converters: :symbol }
    ) do |row|
      Country.create!(
        name: row[:name]
      )
    end

  CSV.readlines('app/data/seed_data/events.csv',{ headers: true,
    header_converters: :symbol }
    ) do |row|
      Event.create!(
        start_date: row[:start_date],
        end_date: row[:end_date],
        start_time: row[:start_time],
        end_time: row[:end_time],
        venue_id: row[:venue_id],
        title:    row[:title]
      )
    end

  CSV.readlines('app/data/seed_data/localities.csv',{ headers: true,
    header_converters: :symbol }
    ) do |row|
      Locality.create!(
        name: row[:name],
        administrative_area_id: row[:administrative_area_id]
      )
    end

  CSV.readlines('app/data/seed_data/venue_events.csv',{ headers: true,
    header_converters: :symbol }
    ) do |row|
      VenueEvent.create!(
        venue_id: row[:venue_id],
        event_id: row[:event_id]
      )
    end

  CSV.readlines('app/data/seed_data/venues.csv',{ headers: true,
    header_converters: :symbol }
    ) do |row|
      Venue.create!(
        name: row[:name],
        locality_id: row[:locality_id]
      )
    end
