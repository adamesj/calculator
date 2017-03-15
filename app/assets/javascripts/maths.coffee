# Place all the behaviors and hooks related to the matching controller here.
# All this logic will automatically be available in application.js.
# You can use CoffeeScript in this file: http://coffeescript.org/
$(document).ready ->

  input_field = $("#input")

  $("[data-input]").on 'click', ->
    input_field.append $(@).data('value')

  $("[data-clear]").on 'click', ->
    input_field.html("")

  $("[data-submit]").on 'click', ->
    path = $(@).data('path')
    data = expression: $("#input").html()
    $.getJSON path, data
    .success (result) ->
      input_field.html result.value
    .error ->
      alert "Выражение не обработалось. Возможно, оно некорректное?"
