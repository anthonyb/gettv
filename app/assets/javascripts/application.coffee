#= require jquery
#= require jquery_ujs
#= require jquery.form
#= require underscore
#= require underscore.string
#= require fastclick
#= require share
#= require no_bounce

_.mixin(_.str.exports())

$ ->
  # simulate loading proccess
  # TODO: attache image loading process + logo

  setTimeout(( -> $('#app_loading').addClass('hidden') ; $('#app_welcome').removeClass('hidden') ), 0)

  # fast click on touch devices

  FastClick.attach(document.body)

  # welcome screen

  $('#start').on 'click', ->
    $('#app_welcome').addClass 'hidden'
    $('#app_header, #app_wizzard').removeClass 'hidden'

  # navigate wizzard

  # showScreen = (idx) ->
  #   $('#app_wizzard .app-screen').addClass 'hidden'
  #   $("#app_wizzard .app-screen:eq(#{idx})").removeClass 'hidden'
  #   $("#nav a:eq(#{idx})").removeClass 'locked'

  # $('#nav a').on 'click', (e) ->
  #   if not $(@).hasClass 'locked'
  #     idx = $('#nav a').index(@)
  #     showScreen(idx)
  #     $('#nav a').removeClass 'current'
  #     $(@).addClass 'current'
  #   e.preventDefault()

  nextScreen = ->
    btn =  $("#nav .current")
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

    characterEl = $(".character[data-id=#{ characterId }]").removeClass('hidden')
    title   = characterEl.find('h1:visible').html()
    characterEl.find('#submission_character').val(title)
    answers = _.map($('.next-screen.selected[data-id]'), (el) -> _.trim($(el).text()) )
    characterEl.find('#submission_answers').val(answers.join(', '))

  # subscription form

  $('.new_submission').ajaxForm
    success: (responseText, statusText, xhr, $form) ->
      $form.addClass('hidden').next().removeClass('hidden')

  # restart

  $('.restart').on 'click', (e) ->
    e.preventDefault()
    $('#app_header').addClass('hidden').find('#nav span').removeClass('current').first().addClass('current')
    $('#app_welcome').removeClass('hidden').next().addClass('hidden')
    $('.app-screen').addClass('hidden').first().removeClass('hidden')
    $('.subscription-thanks').addClass('hidden').prev().removeClass('hidden')
    $('.next-screen').removeClass('selected')
    $('.character').addClass('hidden')
