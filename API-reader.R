downloadMatches <- function(eventKey, APIKey) {
  url <- paste("https://www.thebluealliance.com/api/v3/event/", eventKey, "/matches/simple", sep = "")
  dir <- paste(getwd(), "/matches/", eventKey, ".json", sep = "")
  h <- new_handle()
  handle_setheaders(h, .list = list("X-TBA-Auth-Key" = APIKey))
  
  curl_download(url, destfile = dir, mode = "w", handle = h)
}

downloadOPRs <- function(eventKey, APIKey) {
  url <- paste("https://www.thebluealliance.com/api/v3/event/", eventKey, "/oprs", sep = "")
  dir <- paste(getwd(), "/oprs/", eventKey, ".json", sep = "")
  h <- new_handle()
  handle_setheaders(h, .list = list("X-TBA-Auth-Key" = APIKey))
  
  curl_download(url, destfile = dir, mode = "w", handle = h)
}