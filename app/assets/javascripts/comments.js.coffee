$(document).ready ->
  $("#new_comment").on("ajax:success", (e, data, status, xhr) ->
    debugger;
    $(".panel-default").first().before data
  ).on "ajax:error", (e, xhr, status, error) ->
    $("#new_article").append "<p>ERROR</p>"
