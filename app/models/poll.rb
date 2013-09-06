class Poll

  attr_accessor :votes

  def initialize(opts)
    self.votes = opts[:votes]
  end

  def self.current
    votes = Vote.where("DATE(created_at) = ?", Date.today).to_a
    Poll.new(votes: votes)
  end

  def venues
    votes.group_by(&:venue).map{|venue, votes| VenueWithVotes.new(venue, votes) }
  end

  def venue(venue_name)
    venues.find{|venue_with_votes| venue_with_votes.venue.name == venue_name}
  end

  class VenueWithVotes
    attr_accessor :venue, :votes

    def initialize(venue, votes)
      self.venue = venue
      self.votes = votes
    end

    def name
      venue.name
    end
  end

end
