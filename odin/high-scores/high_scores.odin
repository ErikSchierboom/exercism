package high_scores

import "core:slice"

High_Scores :: struct {
	scores: []int
}

new_scores :: proc(initial_values: []int) -> High_Scores {
	return High_Scores{slice.clone(initial_values)}
}

destroy_scores :: proc(s: ^High_Scores) {
	delete(s.scores)
}

scores :: proc(s: High_Scores) -> []int {
	return slice.clone(s.scores)
}

latest :: proc(s: High_Scores) -> int {
	return s.scores[len(s.scores) - 1]
}

personal_best :: proc(s: High_Scores) -> (result: int) {
	for score in s.scores do result = max(result, score)
	return
}

personal_top_three :: proc(s: High_Scores) -> []int {
	scores := slice.clone(s.scores)
	slice.reverse_sort(scores)
	return scores[:min(3, len(scores))]
}
