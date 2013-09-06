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
    begin
      response.headers['Content-Type'] = 'text/event-stream'
      event_source = EventSource.new(response.stream)

      Poll.on_event(:update) do |event, poll|
        event_source.publish event, poll
      end

    ensure
      event_source.close
    end
  end
end
