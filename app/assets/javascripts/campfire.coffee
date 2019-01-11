# Place all the behaviors and hooks related to the matching controller here.
# All this logic will automatically be available in application.js.
# You can use CoffeeScript in this file: http://coffeescript.org/

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
    color: randomColor(seed: username, luminosity: 'light')

  App.campfire.speak(data)
  event.target.value = ''
  event.preventDefault()

$ ->
  $(document).on 'click', '#submit', submit
  $(document).on 'keypress', '[data-behavior~=speak]', submitViaEnter