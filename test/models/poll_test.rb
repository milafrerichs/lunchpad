#encoding: utf-8
require 'test_helper'

describe Poll do

  describe 'current' do

    it 'returns a poll with todays votes' do
      Vote.delete_all
      yesterday = Vote.create(created_at: Date.yesterday)

      today_1 = Vote.create
      today_2 = Vote.create

      Poll.current.votes.length.must_equal 2
    end
  end

  describe 'venues' do

    it 'groups the given votes by venue' do
      votes = []

      votes << Vote.add(user_name: 'Micha', plan: 'CC um 12:15')
      votes << Vote.add(user_name: 'Heiko', plan: 'CC um 12:15')
      votes << Vote.add(user_name: 'Yasmin', plan: 'CC um 12:30')

      votes << Vote.add(user_name: 'Sam', plan: 'Royals & Rice um 12:30')
      votes << Vote.add(user_name: 'Lars', plan: 'Royals & Rice um 12:30')

      votes << Vote.add(user_name: 'Thomas', plan: 'Döner um 12:30')

      poll = Poll.new(votes: votes)

      poll.venues.length.must_equal 3
      poll.venues.map(&:name).sort.must_equal ['CC', 'Döner', 'Royals & Rice']

      poll.venue('CC').votes.length.must_equal 3
      poll.venue('CC').votes.map(&:user_name).sort.must_equal ['Heiko', 'Micha', 'Yasmin']
      poll.venue('Döner').votes.length.must_equal 1
    end

  end
end
