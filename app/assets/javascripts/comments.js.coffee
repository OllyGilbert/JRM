$(document).ready ->
  
  #$("#Journalist").on("ajax:success", (e, data, status, xhr) ->
  #  console.log 'Ajax success', data
  #  $(".panel-default").first().before "<div class='panel panel-default'><div class='panel-body'>" + data.content +  "<div>" + data.created_at + "</div></div>"
  #).on "ajax:error", (e, xhr, status, error) ->
  #  $("#new_article").append "<p>ERROR</p>"
  addComment = ->
    content = $("#comment_content").val()
    $.ajax(
      type: "POST"
      url: "/journalists/" + parseInt(location.pathname.split("/").pop()) + "/comments"
      data: { comment: { content: content } }
    ).done((data) ->
      console.log "Ajax success", data
      $(".panel-default").first().before "<div class='panel panel-default'><div class='panel-body'>" + data.content +  "<div>" + data.created_at + "</div></div>"
      $("#comment_content").val('')
    ).fail (err) ->
      console.log 'error!'
      $("#new_article").append "<p>ERROR</p>"


  $("#Story").on("ajax:success", (e, data, status, xhr) ->
    console.log 'You need to append to the story'
  ).on "ajax:error", (e, xhr, status, error) ->
    $("#new_article").append "<p>ERROR</p>"

  $("#comment_content").bind "enterKey", (e) ->
    addComment()
  $("#comment_content").keyup (e) ->
   $(this).trigger "enterKey" if e.keyCode is 13
   return
