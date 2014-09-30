class App.Views.Content extends Backbone.View
  className: "row"
  template: HandlebarsTemplates['content']
  render: ->
    @$el.html(@template())
    this
  initialize: ->
    @listenTo App.Vent, "project:create", @swapMainToEmpty
    @listenTo App.Vent, "project:new", @swapMainToNewProject
    @listenTo App.Vent, "project:show", @swapMainToShowProject
    @listenTo App.Vent, "project:destroy", @swapMainToEmpty
    @listenTo App.Vent, "project:edit", @swapMainToEdit

  swapMainToEdit: (model) ->
    console.log model.toJSON()
    @swapMain(new App.Views.NewProject({model: model}))
    Backbone.history.navigate("/projects/edit/"+ model.id)

  swapMainToNewProject: ->
    @swapMain(new App.Views.NewProject(model: new App.Models.Project))
    Backbone.history.navigate("/projects/new")

  swapMainToEmpty: ->
    @swapMain(new App.Views.Empty)
    Backbone.history.navigate("/projects")

  swapMainToShowProject: (model) ->
    @swapMain(new App.Views.ProjectDetails({model: model}))

  swapMain: (v) ->
    @changeCurrentMainView(v)
    @$('#main-area').html(@currentMainView.render().el)

  changeCurrentMainView: (v) ->
    @currentMainView.leave() if @currentMainView
    @currentMainView = v

  swapSide: (v) ->
    @changeCurrentSideView(v)
    @$('#sidebar-area').html(@currentSideView.render().el)

  changeCurrentSideView: (v) ->
    @currentSideView.leave() if @currentSideView
    @currentSideView = v