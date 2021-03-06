% Generated by roxygen2 (4.0.1): do not edit by hand
\name{rate.players}
\alias{rate.players}
\title{Rate the players in a set of OCTGN data using Glicko.}
\usage{
rate.players(octgn, period.select = "week", history = FALSE,
  init = c(1500, 350))
}
\arguments{
\item{octgn}{A data frame produced by read.octgn().}

\item{period.select}{A duration, such as \code{"week"} or \code{"month"}.
Ratings are computed over each period. For ANR OCTGN data, \code{"week"} is
generally best and is the defaut.}

\item{history}{If \code{TRUE}, save and return rating history in
\code{player.ratings}.}

\item{init}{Initialization parameters for the Glicko algorithm. By default, a
1500 initial rating and 350 deviation.}
}
\value{
A data frame of computed ratings, optionally with
  rating history.
}
\description{
This function accepts a data frame of processed OCTGN data and rates the players
using the Glicko algorithm. The Glicko period defaults to weekly, but monthly
is also accepted.
}

