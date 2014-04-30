#= require character
#= require ./admin/genres

# Modules =================================================

chr.genericModule 'Submission',
  menuIcon:       'envelope-o'
  menuTitle:      'Submissions'
  listItem:
    titleField:   'full_name'
    metaField:    'email'
  listScopes:
    default:
      orderBy:    'full_name:asc'
  newItems:       false
  deletable:      false

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

# Settings Modules ========================================

chr.settingsGenres()
chr.settingsWebsite()
chr.settingsAdmins()