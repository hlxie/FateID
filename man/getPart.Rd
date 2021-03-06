% Generated by roxygen2: do not edit by hand
% Please edit documentation in R/FateID_functions.R
\name{getPart}
\alias{getPart}
\title{Inference of a cell type partition}
\usage{
getPart(x, FMarker, fthr = NULL, n = 25)
}
\arguments{
\item{x}{expression data frame with genes as rows and cells as columns. Gene IDs should be given as row names and cell IDs should be given as column names. This can be a reduced expression table only including the features (genes) to be used in the analysis.}

\item{FMarker}{list of vectors of gene IDs corresponding to valid rownames of \code{x}. The gene IDs within each component of \code{FMarker} are considered as marker genes of one of the cell types in the dataset. The aggregated expression of the genes for each component is compared to a threshold defined by the input argument \code{fthr} or \code{n}. All cells exceeding this threshold are assigned to a cluster representing cells with expression of the respective marker genes.}

\item{fthr}{vector of real positive numbers. This vector has to have the same length as the list \code{FMarker} and contains a threshold for the aggregated expression of all genes in the corresponding component of \code{FMarker}. If NULL then a threshold is inferred from the \code{n} top-expressing cells for the genes in the respective component of \code{FMarker}.}

\item{n}{positive integer number. For each component of \code{FMarker} the expression of all genes is aggregated in every cell and the \code{n} top-expressing cells are extracted. The average expression across these cell defines the expression threshold applied to infer the partitioning. Default value is 25.}
}
\value{
A list with the following three components:
  \item{part}{A vector with a partitioning, i. e. cluster assignment for each cell.}
  \item{tar}{A vector with the numbers of target clusters. Cluster 1 comprises all cells with no enrichment of marker genes. The remaining clusters correspond to cell types up-regulating the markers in the list \code{FMarker} in the same order as in this list.}
  \item{thr}{A vector with expression threshold values applied for each component in the list \code{FMarker} in the same order as in this list.}
}
\description{
This function performs an inference of a cell type partition based on the expression of marker genes.
}
\examples{
x <- intestine$x
y <- intestine$y

FMarker <- list(c("Defa20__chr8","Defa24__chr8"), "Clca3__chr3", "Alpi__chr1")
xf <- getPart(x,FMarker,fthr=NULL,n=5)

}
