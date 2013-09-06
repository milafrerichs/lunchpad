class Vote < ActiveRecord::Base
  belongs_to :user
  belongs_to :venue

  def self.add_or_update(opts)
    plan = opts[:plan]
    user_name = opts[:user_name]

    time = extract_time(plan)
    venue_name = extract_venue_name(plan)

    user = User.user_for(user_name)
    venue = Venue.venue_for(venue_name)

    vote = Poll.current.vote_of user_name

    if vote
      vote.update_attributes(preferred_lunch_time: time, venue: venue)
    else
      vote = Vote.create(preferred_lunch_time: time, venue: venue, user: user)
    end

    vote
  end

  def self.extract_time(plan)
    time_string = plan.split("um").last
    hour, minutes = time_string.split(":")

    today = Date.today
    DateTime.new(today.year, today.month, today.day, hour.to_i, minutes.to_i)
  end

  def self.extract_venue_name(plan)
    plan.split("um").first.strip
  end

  def user_name
    user.name
  end
end
