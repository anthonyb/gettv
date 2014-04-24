#= require character

# ---------------------------------------------------------
# QUESTIONS
# ---------------------------------------------------------

@Character.Questions = {}
@Character.Questions.DetailsLayout = Character.Generic.DetailsLayout.extend
  afterRenderContent: ->
    @ui.reorderableItems = @ui.content.find('.sortable-list')
    options =
      delay:  150
      items:  '> .fields'
      update: (e, ui) =>
        # # TODO: seems like this could be done much simpler with regex
        positionFields = _.select @ui.reorderableItems.find("input[type=hidden]"), (f) ->
          _( $(f).attr('name') ).endsWith('[_position]')
        _.each positionFields, (el, index, list) ->
          $(el).val(positionFields.length - index)

    @ui.reorderableItems.sortable(options).disableSelection()

  afterOnClose: ->
    @ui.reorderableItems.sortable('destroy')

# Modules =================================================

chr.genericModule 'Question',
  menuIcon:       'question'
  menuTitle:      'Questions'
  implementation: Character.Questions
  listItem:
    titleField:   'title'
    metaField:    'updated_ago'
  newItems:       false
  deletable:      false
  listReorder:    true

chr.genericModule 'Character',
  menuIcon:       'users'
  menuTitle:      'Characters'
  modelName:      'Result'
  listItem:
    titleField:   'chr_title'
    metaField:    'updated_ago'
  listReorder:    true

# chr.postsModule()
# chr.pagesModule()

# Settings Modules ========================================

chr.settingsWebsite()
# chr.settingsPostCategories()
chr.settingsAdmins()