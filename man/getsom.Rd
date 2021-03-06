% Generated by roxygen2: do not edit by hand
% Please edit documentation in R/FateID_functions.R
\name{getsom}
\alias{getsom}
\title{Topological ordering of pseudo-temporal expression profiles}
\usage{
getsom(x, nb = 1000, alpha = 0.5)
}
\arguments{
\item{x}{expression data frame with genes as rows and cells as columns. Gene IDs should be given as row names and cell IDs should be given as column names. The pseudo-temporal expression profile of each gene is defined by the order of cell IDs, i. e. columns, in \code{x}.}

\item{nb}{positive integer number. Number of nodes of the self-organizing map. Default value is 1000.}

\item{alpha}{positive real number. Pseudo-temporal expression profiles are derived by a local regression of expression values across the ordered cells using the function \code{loess} from the package \pkg{stats}. This is the parameter, which controls the degree of smoothing. Larger values return smoother profiles. Default value is 0.5.}
}
\value{
A list of the following three components:
\item{som}{a \code{som} object returned by the function \code{som} of the package \pkg{som}}
\item{x}{pseudo-temporal expression profiles, i. e. the input expression data frame \code{x} after smoothing by running mean or local regression, respectivey, and normalization. The sum of smoothened gene expression values across all cells is normalized to 1.}
\item{zs}{data frame of z-score transformed pseudo-temporal expression profiles.}
}
\description{
This function computes a topological ordering of pseudo-temporal expression profiles of all genes by using 1-dimensional self-organizing maps.
}
\examples{

\donttest{
x <- intestine$x
y <- intestine$y
v <- intestine$v

tar <- c(6,9,13)
fb <- fateBias(x,y,tar,z=NULL,minnr=5,minnrh=10,nbfactor=5,use.dist=FALSE,seed=NULL,nbtree=NULL)
dr <- compdr(x,z=NULL,m="cmd",k=2,lle.n=30,dm.sigma=1000,dm.distance="euclidean",tsne.perplexity=30)
pr <- prcurve(y,fb,dr,k=2,m="cmd",trthr=0.4,start=NULL)
n <- pr$trc[["t6"]]
fs  <- filterset(v,n,minexpr=2,minnumber=1)
s1d <- getsom(fs,nb=1000,alpha=.5)
}

}
