combinations <- function(size, goal_sum, exclude) {
    candidates <- c(1:9) |>
        setdiff(exclude) |>
        combn(size, simplify = FALSE)
    candidates[lapply(candidates, sum) == goal_sum]
}
