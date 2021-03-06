#' Rate the players in a set of OCTGN data using Glicko.
#' 
#' This function accepts a data frame of processed OCTGN data and rates the players
#' using the Glicko algorithm. The Glicko period defaults to weekly, but monthly
#' is also accepted. 
#' 
#' @param octgn A data frame produced by read.octgn().
#' @param period.select A duration, such as \code{"week"} or \code{"month"}.
#'   Ratings are computed over each period. For ANR OCTGN data, \code{"week"} is
#'   generally best and is the defaut.
#' @param history If \code{TRUE}, save and return rating history in
#'   \code{player.ratings}.
#' @param init Initialization parameters for the Glicko algorithm. By default, a
#'   1500 initial rating and 350 deviation.
#' @return A list containing a data frame of computed ratings, optionally with
#'   rating history.
#' @import PlayerRatings dplyr
#' @importFrom lubridate floor_date
#'   
#' @export

rate.players <- function( octgn, period.select = "week", history = FALSE, init = c(1500, 350) ) {
  
  # Take the date floor of each period to divide the games up for Glicko.   
  octgn$Period <- floor_date(octgn$GameStart, period.select)
  
  #-----------------------------------------------------------------------------
  # COMPUTING PLAYER RATINGS
  #-----------------------------------------------------------------------------
  
  # Use PlayerRatings package to compute Glicko rating for each player. Glicko requires the data to have:
  # 1. Time block as numeric.
  # 2. Numeric or character identifier for player one. 
  # 3. Numeric or character identifier for player two.
  # 4. The result of the game expressed as numeric -- 1 for P1 win, 0 for P2 win, 0.5 for draw.   
  ratings <- select(octgn, Period, Corp_Player, Runner_Player, Win)
  
  # Convert Win/Loss factor to 1/0. 
  ratings$Win <- as.numeric(ratings$Win)
  
  # Convert the Period "dates" to a factor and then to a numeric in order to pass them to glicko(). 
  ratings$Period <- cut(ratings$Period, breaks = period.select)
  ratings$Period <- as.numeric(ratings$Period)
  
  # Note that per its creator, Glicko works best when each player is playing 5-10 games per rating period. 
  ratings <- glicko(ratings, history = history, sort = TRUE, init = init)
  
  # Now I have ratings for each player in each period. 
  return( ratings )
  
}