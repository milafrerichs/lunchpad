class EventSource
  def initialize(io)
    @io = io

    publish 'connect'
  end

  def publish(event, data={})
    @io.write "event: #{event}\n"
    @io.write "data: #{data.to_json}\n\n"
  end

  def close
    @io.close
  end
end
