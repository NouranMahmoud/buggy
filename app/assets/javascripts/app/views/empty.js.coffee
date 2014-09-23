class App.Views.Empty extends Backbone.View
  className: "well well-large"
  render: ->
    @$el.html("<h1> you have to choose a project first</h1>")