#= require jquery
#= require jquery_ujs
#= require fastclick
#= require no_bounce

$ ->
  FastClick.attach(document.body)

  $('#start').on 'click', ->
    $('#app_welcome').addClass 'hidden'
    $('#app_header, #app_wizzard').removeClass 'hidden'

  showScreen = (idx) ->
    $('#app_wizzard .app-screen').addClass 'hidden'
    $("#app_wizzard .app-screen:eq(#{idx})").removeClass 'hidden'

  $('#nav a').on 'click', (e) ->
    idx = $('#nav a').index(@)
    showScreen(idx)
    $('#nav a').removeClass 'current'
    $(@).addClass 'current'
    e.preventDefault()