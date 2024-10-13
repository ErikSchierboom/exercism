is_valid <- function(isbn) {
  isbn <- gsub(pattern = "-", replacement = "", isbn)
  if (!grepl("^\\d{9}(\\d|X)$", isbn)) {
    return(FALSE)
  }

  chars <- isbn |> strsplit("") |> unlist()
  if (chars[10] == "X") chars[10] <- "10"

  sum(as.numeric(chars) * 10:1) %% 11 == 0
}
