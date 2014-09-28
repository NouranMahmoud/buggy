class App.Views.Empty extends Backbone.View
  className: "well well-lg"
  render: ->
    @$el.html("<h3> you have to choose a project first</h3>")