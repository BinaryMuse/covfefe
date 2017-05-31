{CompositeDisposable} = require 'atom'

module.exports = Covfefe =
  subscriptions: null

  activate: (state) ->
    @subscriptions = new CompositeDisposable
    @subscriptions.add atom.commands.add 'atom-workspace', 'covfefe:covfefeize': => @covfefeize()

  deactivate: ->
    @subscriptions.dispose()

  covfefeize: ->
    editor = atom.workspace.getActiveTextEditor()
    selections = editor.getSelections()
    for selection in selections
      selection.insertText(selection.getText() + ' covfefe')
