#= require jquery
#= require jquery_ujs
#= require jquery.form
#= require underscore
#= require underscore.string
#= require fastclick
#= require no_bounce
#= require PxLoader
#= require PxLoaderImage

_.mixin(_.str.exports())

$ ->
  # simulate loading proccess

  loader = new PxLoader { statusInterval: 50 }
  loader.addImage(i) for i in window.PRELOADED_IMAGES
  loader.addCompletionListener -> $('#app_loading').addClass('hidden') ; $('#app_welcome').removeClass('hidden')
  setTimeout ( -> loader.start() ), 5

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
    $("#nav .step:eq(#{idx})").removeClass 'locked'

  $('#nav .step').on 'click', (e) ->
    if not $('#app_header').hasClass 'result'
      if not $(@).hasClass 'locked'
        idx = $('#nav .step').index(@)
        showScreen(idx)
        $('#nav .step').removeClass 'current'
        $(@).addClass 'current'

  nextScreen = ->
    btn =  $("#nav .current")
    srn = $('#app_wizzard .app-screen:visible')

    btn.removeClass('current').next().addClass('current').removeClass('locked')
    srn.addClass('hidden').next().removeClass('hidden')

    if srn.next().hasClass 'result'
      pickCharacter()
      $('#app_header').addClass 'result'

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
    title   = characterEl.find('.character-name:visible').html()
    characterEl.find('#submission_character').val(title)
    answers = _.map($('.next-screen.selected[data-id] .img-holder > img'), (el) -> _.trim($(el).attr('alt')) )
    characterEl.find('#submission_answers').val(answers.join(', '))

  # subscription form

  # remove honeypot
  $('input[type=phone]').remove()

  validateEmail = (email) ->
    re = /^(([^<>()[\]\\.,;:\s@\"]+(\.[^<>()[\]\\.,;:\s@\"]+)*)|(\".+\"))@((\[[0-9]{1,3}\.[0-9]{1,3}\.[0-9]{1,3}\.[0-9]{1,3}\])|(([a-zA-Z\-0-9]+\.)+[a-zA-Z]{2,}))$/
    re.test(email)

  $('.new_submission input[type=submit]').on 'click', (e) -> $(e.currentTarget).parent().submit()

  addFocus = ($input) ->
    $input.on 'touchstart', (e) ->
      $(e.currentTarget).focus() if not $(e.currentTarget).is(':focus')
    $input.trigger('touchstart')
    $input.off 'touchstart'

  $('.new_submission').ajaxForm
    clearForm: true
    beforeSubmit: (arr, $form, options) ->
      $email = $form.find('#submission_email')
      $name  = $form.find('#submission_full_name')
      $zip   = $form.find('#submission_zip_code')
      $genre = $form.find('#submission_favorite_genre')
      $helper = $form.find('.helper')
      if validateEmail($email.val())
        $email.parent().removeClass('error')
      else
        $email.parent().addClass('error')
        addFocus($email)
        return false
      if $email.is(':focus')
        addFocus($helper)
        return false
      if $name.is(':focus')
        addFocus($helper)
        return false
      if $zip.is(':focus')
        addFocus($helper)
        return false

    success: (responseText, statusText, xhr, $form) ->
      $form.addClass('hidden').next().removeClass('hidden')
      $form.find('#submission_email').parent().removeClass('error')

  # restart

  $('.restart').on 'click', (e) ->
    e.preventDefault()
    $('.new_submission').clearForm()
    $('.submission_email.error').removeClass('error')
    $('#app_header').removeClass('result').addClass('hidden').find('#nav span').removeClass('current').first().addClass('current')
    $('#app_welcome').removeClass('hidden').next().addClass('hidden')
    $('.app-screen').addClass('hidden').first().removeClass('hidden')
    $('.subscription-thanks').addClass('hidden').prev().removeClass('hidden')
    $('.next-screen').removeClass('selected')
    $('.character').addClass('hidden')
    $('#nav .step').addClass('locked').first().addClass('current').removeClass('locked')
