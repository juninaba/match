class MatchingController < ApplicationController
  def index
    #自分に「いいね」をしてくれた人のuser_idを取得
    got_reaction_user_ids = Reaction.where(to_user_id: current_user.id, status: 'like').pluck(:from_user_id)
    #いいね」を押してくれた人の中から自分が「いいね」をつけたユーザーを取得
    @match_users = Reaction.where(to_user_id: got_reaction_user_ids, from_user_id: current_user.id, status: 'like').map(&:to_user)
  end
end
