\name{spam64-package}
\alias{spam64-package}
\alias{spam64}
\alias{SPAM64}
\alias{Spam64}
\docType{package}
\title{64-bit extension for the SPArse Matrix Package spam}
\description{Provides the Fortran code of the R package \pkg{spam} with 64-bit integers. 
  Loading this package together with the R package \pkg{spam} enables the sparse matrix class spam to handle huge sparse matrices with more than 2^31-1 non-zero elements. 
}

\note{It is intended to use \pkg{spam64} together with \pkg{spam}. To avoid issues
  on 32-bit platforms we did not link the packages \pkg{spam} and
  \pkg{spam64} using dependencies.\cr
  Some \pkg{spam64} functions have been successfully tested with 64-bit
  matrices.
  However, we expect that some functions of \pkg{spam} do not
  work with 64-bit matrices (yet). Please do not hesitate to contact us via email
  or https://git.math.uzh.ch/reinhard.furrer/spam in case you would
  like to use a spam function with 64-bit matrices that is not working
  properly in the current version. 
}

\examples{
\dontrun{
library("spam")
library("spam64")
s1 <- spam(1, ncol=2^30)        # 32-bit matrix
s1

s2 <- cbind(s1, s1)             # 64-bit matrix
s2

s3 <- spam(1, ncol=2^31)        # 64-bit matrix
s3
}
}
\author{Reinhard Furrer [aut, cre], Florian Gerber [ctb], Daniel Gerber [ctb], Kaspar Moesinger [ctb], Youcef Saad [ctb] (SPARSEKIT http://www-users.cs.umn.edu/~saad/software/SPARSKIT/), Esmond G. Ng [ctb] (Fortran Cholesky routines), Barry W. Peyton [ctb] (Fortran Cholesky routines), Joseph W.H. Liu [ctb] (Fortran Cholesky routines), Alan D. George [ctb] (Fortran Cholesky routines). \cr
}

\references{
F. Gerber, K. Moesinger, R. Furrer (2017), Extending R packages to support 64-bit compiled code: An illustration with spam64 and GIMMS NDVI3g data,
Computer & Geoscience 104, 109-119,
https://doi.org/10.1016/j.cageo.2016.11.015.

spam64 uses the R package dotCall64 to call compiled code:
F. Gerber, K. Moesinger, R. Furrer (2017),
dotCall64: An efficient interface to compiled C/C++ and Fortran code supporting long vectors,
https://arxiv.org/abs/1702.08188.
}

\keyword{documentation}
\keyword{package}
