class App.Views.Header extends Backbone.View
  className: "navbar"
  template: HandlebarsTemplates['header']
  render: ->
    @$el.html(@template())
    this