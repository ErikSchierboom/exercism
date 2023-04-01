library(tidyverse)

tournament <- function(input) {
  rows <- sapply(input, function(row) { strsplit(row, ";") })
  rows <- rows[lengths(rows) == 3]
  rows <- do.call(rbind, rows)
  
  colnames(rows) <- c("Home", "Away", "Result")
  rownames(rows) <- NULL

  wins <- c(rows[,1][rows[,3] == "win"], rows[,2][rows[,3] == "loss"])
  losses <- c(rows[,1][rows[,3] == "loss"], rows[,2][rows[,3] == "win"])
  draws <- c(rows[,1][rows[,3] == "draw"], rows[,2][rows[,3] == "draw"])
  teams <- unique(unlist(c(rows[,1], rows[,2])))
  
  output_table = data.frame(matrix(ncol = 6, nrow = 0))
  
  for (team in teams) {
    team_wins <- length(wins[wins == team])
    team_losses <- length(losses[losses == team])
    team_draws <- length(draws[draws == team])
    
    output_table <- rbind(output_table, c(team,
                                          team_wins + team_losses + team_draws,
                                          team_wins,
                                          team_draws,
                                          team_losses,
                                          team_wins * 3 + team_draws))
  }
  
  colnames(output_table) <- c('Team', 'MP', 'W', 'D', 'L', 'P')
  output_table[, 2:6] <- sapply(output_table[, 2:6], as.numeric)
  output_table <- output_table[order(-output_table$P, output_table$Team), ]
  rownames(output_table) <- 1:(length(teams))
  
  output_table
}

