class App.Views.ProjectDetails extends Backbone.View
  template: HandlebarsTemplates["project_details"]

  render: ->
    @$el.html(@template(@model.toJSON()))
    console.log @model.toJSON()
    this
