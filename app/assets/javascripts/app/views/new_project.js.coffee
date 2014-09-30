class App.Views.NewProject extends Backbone.View
  template: HandlebarsTemplates["new_project"]

  events:
    "click button": "saveProject"

  initialize: ->
    @listenTo @model, "sync", @render
    @listenTo @model, "invalid", @renderErrors
    @model.fetch() unless @model.isNew()

  renderErrors: (model, errors) ->
    @$(".has-error").removeClass("has-error")
    @$("span.help-block").remove()
    _.each errors, @renderError, @

  renderError: (errors, attribute) ->
    err = errors.join(", ")
    console.log attribute
    @$('#' + attribute).closest("div.form-group").addClass('has-error')
    @$('#' + attribute).closest("div.controls").append('<span class="help-block">'+err+'</span>')
  render: ->
    @$el.html(@template(@model.toJSON()))
    this

  saveProject: (e) ->
    e.preventDefault()
    @model.set name: @$('#name').val()
    @model.set description: @$('#description').val()
    @model.save  {},
      success: (model) -> App.Vent.trigger "project:create", model