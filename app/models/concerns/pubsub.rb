module Pubsub
  extend ActiveSupport::Concern

  module ClassMethods
    def publish(event, data)
      redis.publish event, data
    end

    def redis
      @redis ||= Redis.new
    end

    def on_event(event, &block)
      redis.subscribe(event) do |on|
        on.message(&block)
      end
    end

  end
end
