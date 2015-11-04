class Location < ActiveRecord::Base
  has_and_belongs_to_many :stories
  geocoded_by :name   # can also be an IP address
  after_validation :geocode          # auto-fetch coordinates
  reverse_geocoded_by :latitude, :longitude
  after_validation :reverse_geocode  # auto-fetch full_street_address
end
