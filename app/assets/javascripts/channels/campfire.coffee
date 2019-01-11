App.campfire = App.cable.subscriptions.create "CampfireChannel",
  connected: ->
    # Called when the subscription is ready for use on the server

  disconnected: ->
    # Called when the subscription has been terminated by the server

  received: ({ message }) ->
    $('#messages').prepend(message);

  speak: ({ username, content, color }) ->
    @perform 'speak', { username, content, color }