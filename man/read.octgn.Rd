% Generated by roxygen2 (4.0.1): do not edit by hand
\name{read.octgn}
\alias{read.octgn}
\title{Read in an Android: Netrunner OCTGN data file.}
\usage{
read.octgn(octgn.path, pack.rm = TRUE, id.rm = c("Shaper | The Collective"))
}
\arguments{
\item{octgn.path}{A file path to a .csv file of OCTGN data.}

\item{pack.rm}{Whether to remove games without data pack information.
Defaults to TRUE.}

\item{id.rm}{A character vector of IDs to remove. Defaults to 'Shaper: The Collective'.}
}
\value{
A data frame wrapped in dplyr::tbl_df for concise display.
}
\description{
This function reads a .csv file of Android: Netrunner OCTGN data downloaded
from http://octgn.gamersjudgement.com/wordpress/anr/statistics/. It returns a
data frame. To the existing columns, it adds a Win column where a Corporation
win is TRUE and a Runner win is FALSE. This is used by the player rating
function.
}

