$(document).ready ->
  addStoryComment = (element) ->
    textarea = $(element)
    id = textarea.data("story-id")
    content = textarea.val()
    $.ajax(
      type: "POST"
      url: "/stories/" + id + "/comments"
      data: { comment: { content: content } }
    ).done((data) ->
      console.log "Ajax success", data
      $(element).parent().parent().parent().parent().children().last().prepend "<div class='panel panel-default'><div class='panel-body'>" + data.content +  "<div>" + data.created_at + "</div></div>"
      $(element).val('')
    ).fail (err) ->
      console.log 'error!'
      $("#new_article").append "<p>ERROR</p>"

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

  $("#comment_content").bind "enterKey", (e) ->
    addComment()
  $(".story_comment").bind "enterKey", (e) ->
    addStoryComment(event.target)
  $("#comment_content").keyup (e) ->
    $(this).trigger "enterKey" if e.keyCode is 13
    return
  $(".story_comment").keyup (e) ->
    $(this).trigger "enterKey" if e.keyCode is 13
    return
