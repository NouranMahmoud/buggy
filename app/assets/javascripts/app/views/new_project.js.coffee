class App.Views.NewProject extends Backbone.View
  template: HandlebarsTemplates["new_project"]

  events:
    "click button": "saveProject"
  initialize: ->
    @listenTo @model, "sync", @triggerProjectCreated

  triggerProjectCreated: ->
    console.log "project created triggered"
    App.Vent.trigger "project:create", @model
  render: ->
    @$el.html(@template())
    this
  saveProject: (e) ->
    e.preventDefault()
    @model.set name: @$('#name').val()
    @model.set description: @$('#description').val()
    @model.save()