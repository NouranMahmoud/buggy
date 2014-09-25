class App.Views.Footer extends Backbone.View
  className: "bs-docs-footer"
  template: HandlebarsTemplates['footer']
  render: ->
    @$el.html(@template())
    @