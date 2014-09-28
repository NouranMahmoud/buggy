class App.Views.Footer extends Backbone.View
  className: "footer"
  template: HandlebarsTemplates['footer']
  render: ->
    @$el.html(@template())
    this