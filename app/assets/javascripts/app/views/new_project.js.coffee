class App.Views.NewProject extends Backbone.View
  template: HandlebarsTemplates["new_project"]

  events:
    "click button": "saveProject"

  render: ->
    @$el.html(@template())
    this
  saveProject: (e) ->
    e.preventDefault()
    @model.set name: @$('#name').val()
    @model.set description: @$('#description').val()
    @model.save()