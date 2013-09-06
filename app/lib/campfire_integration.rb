module CampfireIntegration

  def self.start_listening
    token = '8446970d745c4c0b30d71c1f24ac33434dd9793f'
    lunch_room_id = 573643
    campfire = Tinder::Campfire.new 'zweitag.de', token: token
    lunch_room = campfire.rooms.find{|r|r.id == lunch_room_id}

    lunch_room.listen do |message|
      handle_message(message)
    end
  end

  def self.handle_message(campfire_message)
    if campfire_message[:type] == "TextMessage"
      puts campfire_message
      puts campfire_message[:body]
      Vote.add(plan: campfire_message[:body], user_name: campfire_message[:user][:name])
    end
  end

end
