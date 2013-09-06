require 'test_helper'

describe User do

  describe 'user_for' do

    it 'creates a non-existing user' do
      User.delete_all

      user_count_before = User.count
      user = User.user_for('Lars')
      User.count.must_equal user_count_before + 1
      user.name.must_equal 'Lars'
    end

    it 'loads an existing user' do
      # TODO why??
      User.delete_all
      User.create(name: 'Lars')

      user_count_before = User.count
      user = User.user_for('Lars')
      User.count.must_equal user_count_before
      user.name.must_equal 'Lars'
    end

  end
end
