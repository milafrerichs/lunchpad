class User < ActiveRecord::Base

  def self.user_for(user_name)
    User.find_or_create_by(name: user_name)
  end

end
