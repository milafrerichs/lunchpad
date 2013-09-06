class PollsController < ActionController::Base
  before_action :load_poll, only: :show

  def load_poll
    @poll = Poll.new.venues
  end

  def show
  end
end
