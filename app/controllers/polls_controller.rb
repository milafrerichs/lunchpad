require 'event_source'

class PollsController < ApplicationController
  include ActionController::Live

  before_action :load_poll, only: :show

  def load_poll
    @poll = Poll.current
  end

  def show
  end

  def stream
    response.headers['Content-Type'] = 'text/event-stream'
    event_source = EventSource.new(response.stream)

    5.times do
      event_source.publish :update, Poll.new.venues

      sleep 2
    end

    event_source.close
  end
end
