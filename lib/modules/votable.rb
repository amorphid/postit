module Voteable
  def score
    upvotes = self.votes.select { |vote| vote.value == 1}
    downvotes = self.votes.select { |vote| vote.value == -1}
    upvotes.count - downvotes.count
  end
end
