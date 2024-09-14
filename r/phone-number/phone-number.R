parse_phone_number <- function(number_string) {
  cleaned <- gsub("\\D", "", number_string)
  ifelse(grepl("^1?([2-9]\\d{2}){2}\\d{4}$", cleaned), 
         gsub("^1", "", cleaned),
         return(NULL))
}
