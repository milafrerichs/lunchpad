$ ->
  subscribe = ->
    console.log('polling stream')
    source = new EventSource(window.location + '/stream')
    source.onopen = (e) ->
      console.log('opened stream')
    source.addEventListener 'update', (e) ->
      console.log {event: e}
      window.location.reload()
    source.onerror = (e) ->
      console.log {error: e}
    console.log(source: source)

  setTimeout subscribe, 200
