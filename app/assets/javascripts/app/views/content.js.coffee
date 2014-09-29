class App.Views.Content extends Backbone.View
  className: "row"
  template: HandlebarsTemplates['content']
  render: ->
    @$el.html(@template())
    this
  initialize: ->
    @listenTo App.Vent, "project:create", @swapMainToNewProject
    @listenTo App.Vent, "project:new", @swapMainToNewProject

  swapMainToNewProject: ->
    @swapMain(new App.Views.NewProject(model: new App.Models.Project))
    #@swapMain(new App.Views.Empty)
    Backbone.history.navigate("/projects/new")

  swapMain: (v) ->
    @changeCurrentMainView(v)
    @$('#main-area').html(@currentMainView.render().el)

  changeCurrentMainView: (v) ->
    @currentMainView.remove() if @currentMainView
    @currentMainView = v

  swapSide: (v) ->
    @changeCurrentSideView(v)
    @$('#sidebar-area').html(@currentSideView.render().el)

  changeCurrentSideView: (v) ->
    @currentSideView.remove() if @currentSideView
    @currentSideView = v