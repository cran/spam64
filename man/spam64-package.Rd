% HEADER %%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%
% This is file ./spam64/man/spam64-package.Rd
% This file is part of the spam64 package, 
%      http://www.math.uzh.ch/furrer/software/spam/
% by Reinhard Furrer [aut, cre], Florian Gerber [ctb], 
%    Daniel Gerber [ctb], Kaspar Moesinger [ctb]            
% HEADER END %%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%
   

\name{. SPAM64 .}
\alias{overview}
\alias{SPAM64}
\alias{Spam64}
\alias{spam64}
\docType{package}
\title{SPArse Matrix Package Extension}
\description{\code{spam64} is the 64-bit extension of the package
  'spam', itself a collection of functions for sparse matrix algebra. 
}
\section{Gereral overview}{
  Unless one works with very large datasets, \code{spam} is sufficient
  and we refer to the documentation thereof.  \cr

  In case one needs to handle matrices or Cholesky factors with more
  than 2^31 elements, 'spam64' is needed.
  This packages provided the 64-bit extension to 'spam' such that there
  is no 32-bit addressing limit.  \cr

  Unless forced, a 64-bit representation is used when only needed.  
    
}
\references{
  'spam64':\cr
   Gerber, F., Moesinger, K., and Furrer, R. (2017). "Extending R Packages
   to Support 64-bit Compiled Code: An Illustration with spam64 and
   GIMMS NDVI3g Data", \emph{Computers & Geosciences}, 104, 109-119,
   \url{10.1016/j.cageo.2016.11.015}.  
   
  'spam':\cr
  Reinhard Furrer, Stephan R. Sain (2010). 
  "spam: A Sparse Matrix R Package with Emphasis on MCMC
  Methods for Gaussian Markov Random Fields",
        \emph{Journal of Statistical Software}, 36(10), 1-25,
        \url{http://www.jstatsoft.org/v36/i10/.}
}
\examples{
require('spam')
spam(1)
str(spam(1))

require('spam64')
spam(1)
str(spam(1))

options(spam.force64=TRUE)
spam(1)
str(spam(1))


## Citations:
citation('spam64')
citation('spam64', auto=TRUE)
}
\author{Reinhard Furrer, Florian Gerber, Kaspar Moesinger, Daniel
  Gerber. \cr
  Some Fortran routines were written by Youcef Saad, Esmond G. Ng, Barry W. Peyton, Joseph W.H. Liu, Alan D. George. }
\keyword{documentation}
\keyword{package}
