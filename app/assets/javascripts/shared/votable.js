// +1 vote for votables
$(document).ready(function() {
  $(".voteable").each(function(){
    var preVoteScore = $(this).find("span.score");

    $(this).find("a.upvote").click(function(event){
      event.preventDefault();
      $.ajax({
        dataType: "json",
        type: "POST",
        url: $(this).attr("href"),
        success: function(data) {
          preVoteScore.text(data);
        }
      });
    });
  });
});

// -1 vote for votables
$(document).ready(function() {
  $(".voteable").each(function(){
    var preVoteScore = $(this).find("span.score");

    $(this).find("a.downvote").click(function(event){
      event.preventDefault();
      $.ajax({
        dataType: "json",
        type: "POST",
        url: $(this).attr("href"),
        success: function(data) {
          preVoteScore.text(data);
        }
      });
    });
  });
});
