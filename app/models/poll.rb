class Poll
  include Pubsub

  def self.update
    publish 'update', Poll.current
  end


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

  def vote_of(user_name)
    binding.pry if votes.any?{|vote| vote.user.nil? }
    votes.find{|vote|vote.user.name == user_name}
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
