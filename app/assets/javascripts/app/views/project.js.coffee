class App.Views.Project extends Backbone.View
  template: HandlebarsTemplates["project"]
  events:
    "click a": "showProject"

  showProject: (e)->
    e.preventDefault
    App.Vent.trigger "project:show", @model
    Backbone.history.navigate "/projects/" + @model.id

  render: ->
    @$el.html(@template(@model.toJSON()))
    this