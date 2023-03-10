has_card(cards, card) = card ∈ cards
find_card(cards, card) = findfirst(isequal(card), cards)
all_cards_even(cards) = all(iseven, cards)
any_odd_cards(cards) = any(isodd, cards)
first_even_card_idx(cards) = findfirst(iseven, cards)

function first_odd_card(cards)
    idx = findfirst(isodd, cards)
    isnothing(idx) ? nothing : cards[idx]
end
