$(document).ready(function() {
  var addComment, addStoryComment;
  addStoryComment = function(element) {
    var content, id, textarea;
    textarea = $(element);
    id = textarea.data("story-id");
    content = textarea.val();
    return $.ajax({
      type: "POST",
      url: "/stories/" + id + "/comments",
      data: {
        comment: {
          content: content
        }
      }
    }).done(function(data) {
      console.log("Ajax success", data);
      $(element).parent().parent().parent().parent().children().last().prepend("<div class='panel panel-default'><div class='panel-body'>" + data.content + "<div>" + data.created_at + "</div></div>");
      return $(element).val('');
    }).fail(function(err) {
      console.log('error!');
      return $("#new_article").append("<p>ERROR</p>");
    });
  };
  addComment = function(element) {
    var content, id, textarea;
    textarea = $(element);
    id = textarea.data("story-id");
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
      $(".panel-default").first().before("<div class='panel panel-default'><div class='panel-body'>" + data.content + "<div>" + data.created_at + "</div></div>");
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
