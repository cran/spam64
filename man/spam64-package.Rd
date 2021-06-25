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
  Conversion between the structures happens when calling low-level
  functions and for some other selected operations.
  \cr
  Some \pkg{spam64} functions have been successfully tested with 64-bit
  matrices.
  However, we expect that some functions of \pkg{spam} do not
  work with 64-bit matrices (yet). Please do not hesitate to contact us via email
  or https://git.math.uzh.ch/reinhard.furrer/spam in case you would
  like to use a spam function with 64-bit matrices that is not working
  properly in the current version.
}

\examples{
library("spam")
library("spam64")

tiny <- spam(1)
pad(tiny) <- c(3,2^32)
tiny
str(tiny)     # tiny matrix big time

print(A <- spam_random(3))
options(spam.force64 = TRUE)    # forcing 64-bit structure
print( B <- spam_random(3))
A+B

options(spam.force64 = FALSE)
B          # No operations, structure is preserved
A+B        # Lowlevel operation, structure is adapted
}
\author{Reinhard Furrer [aut, cre], Florian Gerber [ctb], Daniel Gerber [ctb], Kaspar Moesinger [ctb], Youcef Saad [ctb] (SPARSEKIT http://www-users.cs.umn.edu/~saad/software/SPARSKIT/), Esmond G. Ng [ctb] (Fortran Cholesky routines), Barry W. Peyton [ctb] (Fortran Cholesky routines), Joseph W.H. Liu [ctb] (Fortran Cholesky routines), Alan D. George [ctb] (Fortran Cholesky routines). \cr
}

\references{
F. Gerber, K. Moesinger, R. Furrer (2017), Extending R packages to support 64-bit compiled code: An illustration with spam64 and GIMMS NDVI3g data,
Computer & Geoscience 104, 109-119,
https://doi.org/10.1016/j.cageo.2016.11.015.

spam64 uses the R package dotCall64 to call compiled code:
F. Gerber, K. Moesinger, R. Furrer (2017),
dotCall64: An R package providing an efficient interface to compiled C,
C++, and Fortran code supporting long vectors. SoftwareX, 7, 217-221.
}

\keyword{documentation}
\keyword{package}
