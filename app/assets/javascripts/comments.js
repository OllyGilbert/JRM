$(document).ready(function() {
  $(".comment-form").on("submit", function() {
    $(this).data("")
  });
  var addComment, addStoryComment;

  addStoryComment = function(element) {
    var content, id, textarea;
    textarea = $(element);
    id = textarea.data("resource-id");
    content = textarea.val();
    return $.ajax({
      type: "POST",
      url: "/stories/" + id + "/comments.json",
      content_type: "application/json",
      data: {
        comment: {
          content: content
        }
      }
    }).done(function(data) {
      console.log("Ajax success", data);
      $(element).parent().parent().parent().parent().children().last().prepend("<div class='well well-sm'><div class='media'><a class='media-left'><img src='" + data.user.image + "' /></a><div class='media-body'>" + data.content + "</div><div class='media-right'>" + data.created_at + "</div></div></div>"
        );
      return $(element).val('');
    }).fail(function(err) {
      console.log('error!');
      return $("#new_article").append("<p>ERROR</p>");
    });
  };

  /////////

  addComment = function(element) {
    var content, id, textarea;
    textarea = $(element);
    id = textarea.data("resource-id");
    content = textarea.val();
    return $.ajax({
      type: "POST",
      url: "/journalists/" + id + "/comments",
      data: {
        comment: {
          content: content
        }
      }
    }).done(function(data) {
      console.log("Ajax success", data);

      $("#journalist_comments").prepend("<div class='well'><div class='media'><a class='media-left'><img src='" + data.user.image + "' /></a><div class='media-body'>" + data.content + "</div><div class='media-right'" + data.created_at + "</div></div></div>");
      return $(element).val('');
    }).fail(function(err) {
      console.log('error!');
      return $("#new_article").append("<p>ERROR</p>");
    });
  };
  $(".Journalist").bind("enterKey", function(e) {
    return addComment(event.target);
  });
  $(".Journalist").keyup(function(e) {
    if (e.keyCode === 13) {
      $(this).trigger("enterKey");
    }
  });
  $(".Story").bind("enterKey", function(e) {
    return addStoryComment(event.target);
  });
  return $(".Story").keyup(function(e) {
    if (e.keyCode === 13) {
      $(this).trigger("enterKey");
    }
  });
});
