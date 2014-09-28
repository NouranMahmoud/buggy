class App.Routers.MainRouter extends Backbone.Router

  routes:
    "": "index"
    "projects" : "project"
  initialize: ->
    @headerView = new App.Views.Header()
    @contentView = new App.Views.Content()
    @footerView = new App.Views.Footer()

  index: ->
    console.log "index"
    @layoutViews()
    @contentView.swapMain(new App.Views.Ads())
    @contentView.swapSide(new App.Views.News())

  project: ->
    console.log "project"
    @layoutViews()
    @contentView.swapMain(new App.Views.Empty())
    @contentView.swapSide(new App.Views.Projects({collection: new App.Collections.Projects}))

  layoutViews: ->
    $('#header').html(@headerView.render().el)
    $('#content').html(@contentView.render().el)
    $('#footer').html(@footerView.render().el)