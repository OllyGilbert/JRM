$(document).ready ->
  $("#Journalist").on("ajax:success", (e, data, status, xhr) ->
    console.log 'Ajax success', data
    $(".panel-default").first().before "<div class='panel panel-default'><div class='panel panel-default'>" + data.content + data.created_at + "</div></div>"
  ).on "ajax:error", (e, xhr, status, error) ->
    $("#new_article").append "<p>ERROR</p>"

  $("#Story").on("ajax:success", (e, data, status, xhr) ->
    console.log 'You need to append to the story'
  ).on "ajax:error", (e, xhr, status, error) ->
    $("#new_article").append "<p>ERROR</p>"