$(document).ready(function(){
  $(".downvote").click(downvote);
  $(".upvote").click(upvote);
});

function downvote(e){
  e.preventDefault();
  vote($(this));
}

function upvote(e){
  e.preventDefault();
  vote($(this));
}

function vote(voteableLink) {
  var preVoteScore = voteableLink.closest(".voteable").find(".score");
  newVoteScore(voteableLink, preVoteScore)
}

function newVoteScore(voteableLink, oldScore) {
  $.ajax({
    dataType: "json",
    type: "POST",
    url: voteableLink.attr("href"),
    success: function(newScore) {
      oldScore.text(newScore);
    }
  });
}
