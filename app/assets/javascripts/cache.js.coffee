@Storage = if window.localStorage
  window.localStorage
else
  store = {}

  getItem:    (key)          -> store[key] or null
  removeItem: (key)          -> store[key] = null
  setItem:    (key, content) ->
    store[key] = content
    null

@Cache =
  version: "v1"
  prepareKey: (key) -> "#{@version}.#{key}"

  anHour: ->
    @minutesFromNow 60

  minutesFromNow: (minutes) ->
    now = new Date
    new Date(now.getTime() + minutes * 60 * 1000)

  write: (key, content, time = @anHour()) ->
    key = @prepareKey key
    if _.isNumber(time)
      time = @minutesFromNow time
    Storage.setItem "#{key}-expiry", time.toString()
    Storage.setItem key, content

  read: (key) ->
    key = @prepareKey key
    result = Storage.getItem key
    if result is null
      null
    else
      expiryKey = "#{key}-expiry"
      dateString = Storage.getItem expiryKey
      now = new Date
      date = new Date dateString

      if date < now
        Storage.removeItem key
        Storage.removeItem expiryKey
        null
      else
        result
