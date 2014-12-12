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

  addComment = (element) ->
    textarea = $(element)
    id = textarea.data("story-id")
    content = textarea.val()
    $.ajax(
      type: "POST"
      url: "/journalists/" + id + "/comments"
      data: { comment: { content: content } }
    ).done((data) ->
      console.log "Ajax success", data
      $(".panel-default").first().before "<div class='panel panel-default'><div class='panel-body'>" + data.content +  "<div>" + data.created_at + "</div></div>"
      $(element).val('')
    ).fail (err) ->
      console.log 'error!'
      $("#new_article").append "<p>ERROR</p>"

  $(".Journalist").bind "enterKey", (e) ->
    addComment(event.target)

  $(".Journalist").keyup (e) ->
    $(this).trigger "enterKey" if e.keyCode is 13
    return

  $(".Story").bind "enterKey", (e) ->
    addStoryComment(event.target)

  $(".Story").keyup (e) ->
    $(this).trigger "enterKey" if e.keyCode is 13
    return
