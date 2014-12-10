$(document).ready ->
  $("#new_comment").on("ajax:success", (e, data, status, xhr) ->
    console.log('successful comment')
  ).on "ajax:error", (e, xhr, status, error) ->
    $("#new_article").append "<p>ERROR</p>"
