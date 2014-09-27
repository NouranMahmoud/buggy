class App.Views.Projects extends Backbone.View
  template: HandlebarsTemplates["projects"]

  render: ->
    @$el.html(@template())
    @