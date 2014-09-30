App.Mixins.Validatable =
  parseErrorResponse: (model, resp) ->
    if resp and resp.responseText
      errors = JSON.parse resp.responseText
      @renderErrors(model, errors.errors)

  renderErrors: (model, errors) ->
    @$(".has-error").removeClass("has-error")
    @$("span.help-block").remove()
    _.each errors, @renderError, @

  renderError: (errors, attribute) ->
    err = errors.join(", ")
    console.log attribute
    @$('#' + attribute).closest("div.form-group").addClass('has-error')
    @$('#' + attribute).closest("div.controls").append('<span class="help-block">'+err+'</span>')