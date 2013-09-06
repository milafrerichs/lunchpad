class Venue < ActiveRecord::Base

  def self.venue_for(venue_name)
    Venue.find_or_create_by(name: venue_name)
  end

end
