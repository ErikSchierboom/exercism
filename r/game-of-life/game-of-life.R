tick <- function(cells) {
    coords <- expand.grid(seq_len(nrow(cells)), seq_len(ncol(cells)))

    matrix(apply(coords, 1, function(coord) {
        cell <- cells[coord[1], coord[2]]
        neighbor_coords <- dplyr::inner_join(
            expand.grid(coord[1] + -1:1, coord[2] + -1:1),
            coords
        )
        live_neighbors <- sum(
            apply(neighbor_coords, 1, function(neighbor_coord) {
                cells[neighbor_coord[1], neighbor_coord[2]]
            })
        ) - cell
        ifelse(live_neighbors == 3 ||
            live_neighbors == 2 && cell == 1, 1, 0)
    }), nrow(cells))
}
