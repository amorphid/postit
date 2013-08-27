module ApplicationHelper
  def score(votes)
    upvotes = votes.select { |vote| vote.value == 1}
    downvotes = votes.select { |vote| vote.value == -1}
    upvotes.count - downvotes.count
  end
end
