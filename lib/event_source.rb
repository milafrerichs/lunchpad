class EventSource
  def initialize(io)
    @io = io
  end

  def publish(event, data={})
    @io.write "event: #{event}\n"
    @io.write "data: #{data.to_json}\n"
  end

  def close
    @io.close
  end
end
