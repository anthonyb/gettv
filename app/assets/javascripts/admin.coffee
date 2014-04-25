#= require character
#= require webmaster/character

# Modules =================================================

chr.messagesModule()

chr.genericModule 'Question',
  menuIcon:       'question'
  menuTitle:      'Questions'
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