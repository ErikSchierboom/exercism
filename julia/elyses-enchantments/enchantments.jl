card(cards, idx) = cards[idx]
replace_card!(cards, swap) = (cards[swap.first] = swap.second; cards)
insert_card_at_top!(cards, new_card) = push!(cards, new_card)
remove_card!(cards, idx) = deleteat!(cards, idx)
remove_card_from_top!(cards) = (pop!(cards); cards)
insert_card_at_bottom!(cards, new_card) = pushfirst!(cards, new_card)
remove_card_from_bottom!(cards) = (popfirst!(cards); cards)
check_deck_size(cards, size) = length(cards) == size
