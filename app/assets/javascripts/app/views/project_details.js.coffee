class App.Views.ProjectDetails extends Backbone.View
  template: HandlebarsTemplates["project_details"]
  initialize: ->
    @listenTo @model, "sync", @render
    @model.fetch()

  events:
    "click button.destroy":"deleteProject"

  deleteProject: ->
    return unless confirm("are you sure?")
    @model.destroy
      success: -> App.Vent.trigger "project:destroy"


  render: ->
    @$el.html(@template(@model.toJSON()))
    this
