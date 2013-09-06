$ ->
  subscribe = ->
    console.log('polling stream')
    source = new EventSource(window.location + '/stream')
    source.onopen = (e) ->
      console.log('opened stream')
    source.onmessage = (e) ->
      console.log {event: e}
    source.onerror = (e) ->
      console.log {error: e}
    console.log(source: source)

  setTimeout subscribe, 200