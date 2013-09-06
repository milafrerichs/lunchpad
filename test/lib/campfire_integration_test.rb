require 'test_helper'

describe CampfireIntegration do

  it 'handles a message correctly' do
    Vote.delete_all
    CampfireIntegration.handle_message({body: "CC um 12:30", user: { name: 'Heiko Zeus' }})
    Vote.count.must_equal 1
  end

end
