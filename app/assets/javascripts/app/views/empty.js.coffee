class App.Views.Empty extends Backbone.View
  className: "well well-lg"
  render: ->
    @$el.html("<h1> You have to choose a project first</h1>")
    this