class App.Views.Projects extends Backbone.View
  template: HandlebarsTemplates["projects"]

  initialize: ->
    @listenTo @collection, "reset", @render
    @listenTo App.Vent, "project:create", @addToCollection
    @listenTo @collection, "add", @renderProject
    @collection.fetch({reset: true})

  addToCollection: (model) ->
    @collection.add model
    console.log model + "model added to collection"

  render: ->
    @$el.html(@template())
    @collection.forEach(@renderProject, @)
    this

  renderProject: (model) ->
    v = new App.Views.Project({model: model})
    @$("ul").append(v.render().el)