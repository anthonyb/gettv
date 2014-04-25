#= require jquery
#= require jquery_ujs
#= require underscore
#= require fastclick
#= require share
#= require no_bounce

$ ->
  # fast click on touch devices

  FastClick.attach(document.body)

  # welcome screen

  $('#start').on 'click', ->
    $('#app_welcome').addClass 'hidden'
    $('#app_header, #app_wizzard').removeClass 'hidden'

  # navigate wizzard

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

    pickCharacter() if srn.next().hasClass 'result'

  $('.next-screen').on 'click', (e) ->
    $(@).parent().find('.selected').removeClass('selected')
    $(@).addClass('selected')
    nextScreen()

  # select geneder

  $('#male_choice').on 'click', (e) -> $('.male').removeClass('hidden') ; $('.female').addClass('hidden')
  $('#female_choice').on 'click', (e) -> $('.female').removeClass('hidden') ; $('.male').addClass('hidden')

  # pick character

  pickCharacter = ->
    ids = _.map($('.next-screen.selected[data-id]'), (el) -> $(el).attr 'data-id')

    characterId = null

    # look for character matches all answers, break if found
    # the last character matches all answers
    _.each window.CHARACTERS, (all, cid) ->
      if not characterId
        if _.intersection(all, ids).length == 4
          characterId = cid

    $(".character[data-id=#{ characterId }]").removeClass('hidden')