add_player!(scores, player, score=0) = scores[player] = score
remove_player!(scores, player) = delete!(scores, player)
update_score!(scores, player, score) = scores[player] = score
reset_score!(scores, player) = scores[player] = 0
players(scores) = collect(keys(scores))

