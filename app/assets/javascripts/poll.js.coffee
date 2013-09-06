$ ->
  subscribe = ->
    console.log('polling stream')
    source = new EventSource(window.location + '/stream')
    source.onmessage = (e) ->
      console.log {event: e}
    source.onerror = (e) ->
      console.log {error: e}

  setTimeout subscribe, 200