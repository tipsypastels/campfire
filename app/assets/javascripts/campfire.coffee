# Place all the behaviors and hooks related to the matching controller here.
# All this logic will automatically be available in application.js.
# You can use CoffeeScript in this file: http://coffeescript.org/

@currentUsername = undefined

@colorOf = (username) ->
  randomColor(seed: username, luminosity: 'light')

submitViaEnter = (event) ->
  return if event.keyCode isnt 13
  submit event

submit = (event) ->
  username = $('#username').val()
  unless username
    alert('You must set a username!')
    return

  content = $('#speak').val()
  unless content
    alert('Enter some content!')
    return

  data =
    username: username
    content: content
    color: colorOf(username)

  $('#speak').val('')
  App.campfire.speak(data)
  event.preventDefault()

$ ->
  $(document).on 'click', '#submit', submit
  $(document).on 'keypress', '[data-behavior~=speak]', submitViaEnter

  $(document).on 'change', '#username', (event) ->
    username = event.target.value

    unless username
      $('#you-are').html('')
      window.currentUsername = undefined
      return

    format = """
      You are <span class="username" style="color: #{colorOf(username)}">
        #{username}
      </span>
    """

    $('#you-are').html(format)
    # App.campfire.setName({ username })