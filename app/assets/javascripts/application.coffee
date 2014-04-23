#= require jquery
#= require jquery_ujs
#= require fastclick
#= require share
#= require no_bounce

$ ->
  FastClick.attach(document.body)

  $('#start').on 'click', ->
    $('#app_welcome').addClass 'hidden'
    $('#app_header, #app_wizzard').removeClass 'hidden'

  showScreen = (idx) ->
    $('#app_wizzard .app-screen').addClass 'hidden'
    $("#app_wizzard .app-screen:eq(#{idx})").removeClass 'hidden'
    $("#nav a:eq(#{idx})").removeClass 'locked'

  $('#nav a').on 'click', (e) ->
    if not $(@).hasClass 'locked'
      idx = $('#nav a').index(@)
      showScreen(idx)
      $('#nav a').removeClass 'current'
      $(@).addClass 'current'
    e.preventDefault()

  nextScreen = ->
    btn =  $("#nav a.current")
    srn = $('#app_wizzard .app-screen:visible')

    btn.removeClass('current').next().addClass('current').removeClass('locked')
    srn.addClass('hidden').next().removeClass('hidden')

  $('.next-screen').on 'click', (e) ->
    $(@).parent().find('.selected').removeClass('selected')
    $(@).addClass('selected')
    nextScreen()

  new Share('.share')