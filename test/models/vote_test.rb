require 'test_helper'

describe Vote do

  describe '.add_or_update extracts the information' do

    it 'creates a vote if the user has not voted today' do
      vote = Vote.add_or_update(plan: 'RR um 12:30', user_name: 'Lars')

      vote.persisted?.must_equal true
      vote.user.name.must_equal 'Lars'

      today = Date.today
      vote.preferred_lunch_time.must_equal DateTime.new(today.year, today.month, today.day, 12, 30)
      vote.venue.name.must_equal 'RR'
    end

    it 'updates the users vote ' do
      Vote.delete_all
      Vote.add_or_update(plan: 'RR um 12:30', user_name: 'Lars')
      vote = Vote.add_or_update(plan: 'CC um 12:30', user_name: 'Lars')
      vote.reload

      Vote.count.must_equal 1
      vote.venue.name.must_equal 'CC'
    end
  end

  describe '.extract_time' do

    it 'extracts the time from a string' do
      today = Date.today
      Vote.extract_time('RR um 12:30').must_equal DateTime.new(today.year, today.month, today.day, 12, 30)
      Vote.extract_time('RR um 13:00').must_equal DateTime.new(today.year, today.month, today.day, 13, 00)
    end

  end

  describe '.extract_venue_name' do

    it 'extracts a venue name from a string' do
      Vote.extract_venue_name('RR um 12:30').must_equal "RR"
      Vote.extract_venue_name('China Corner um 13:00').must_equal "China Corner"
    end

  end

end

