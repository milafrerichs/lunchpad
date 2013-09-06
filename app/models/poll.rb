class Poll
  include Pubsub

  def self.update
    publish 'update', Poll.current
  end


  def venues
    [
      Hashie::Mash.new({ name: 'CC', votes:
        [
          { user: 'Micha', time: '12:15' },
          { user: 'Heiko', time: '12:15' },
          { user: 'Yasmin', time: '12:30' }
        ]
      }),
      Hashie::Mash.new({ name: 'Royals & Rice', votes:
        [
          { user: 'Sam', time: '12:30' },
          { user: 'Lars', time: '12:30' }
        ]
      })
    ]
  end

end
