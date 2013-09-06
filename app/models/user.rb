class User < ActiveRecord::Base
  def to_s
    name
  end

  def self.user_for(user_name)
    User.find_or_create_by(name: user_name)
  end

end
