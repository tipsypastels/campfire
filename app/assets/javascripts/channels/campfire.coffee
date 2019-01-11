App.campfire = App.cable.subscriptions.create "CampfireChannel",
  received: (data) ->
    switch data.type
      when 'new_message'
        $('#messages').prepend(data.message)
      when 'set_name'
        window.currentUsername = data.name
      when 'name_reserved'
        alert('You cannot use that name!')
        $('#username').val('')
        $('#username').focus()

  speak: ({ username, content, color }) ->
    @perform 'speak', { username, content, color }

  setName: ({ username }) ->
    @perform 'set_name', 
      new_username: username 
      new_color:    window.colorOf(username)
      old_username: window.currentUsername
      old_color: window.colorOf(window.currentUsername) if window.currentUsername
