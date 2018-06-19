c
      subroutine dn_eigen_f(maxnev, ncv, maxitr,
     &                      n, iwhich,
     &                      na, a, ja, ia,
     &                      v, dr, di, vf , iparam)
c
      implicit none
c
      integer(8)           maxnev, ncv, n, na, vf,
     &                  iwhich, maxitr
c     %--------------%
c     | Local Arrays |
c     %--------------%
c
      integer(8)           iparam(11), ipntr(14),
     &                  ja(*), ia(na+1)
c
      logical(8)           select(ncv)
c
      Double precision
     &                  dr(maxnev+1), di(maxnev+1), resid(n),
     &                  v(n, ncv), workd(3*n),
     &                  workev(3*ncv),
     &                  workl(3*ncv*ncv+6*ncv),
     &                  a(*)
c
c     %---------------%
c     | Local Scalars |
c     %---------------%
c
      character         bmat*1, which*2
      integer(8)           ido, lworkl, info,
     &                  ierr, ishfts, mode
      Double precision
     &                  tol, sigmar, sigmai
c
c     %------------%
c     | Parameters |
c     %------------%
c
      Double precision
     &                  zero
      parameter         (zero = 0.0D+0)
c
      include 'debug.h'
      ndigit = -3
      logfil = 6
      mngets = 0
      mnaitr = 0 
      mnapps = 0
      mnaupd = vf
      mnaup2 = vf
      mneupd = 0
c
      bmat   = 'I'
c
      lworkl = 3*ncv*ncv+6*ncv
      tol    = zero
      ido    = 0
      info   = 0
c
      ishfts = 1
      mode   = 1
c
      iparam(1) = ishfts
      iparam(3) = maxitr 
      iparam(7) = mode
c
      if (iwhich .eq. 1) then
            which = 'LM'
      else if (iwhich .eq. 2) then
            which = 'SM'
      else if (iwhich .eq. 3) then
            which = 'LR'
      else if (iwhich .eq. 4) then
            which = 'SR'
      else if (iwhich .eq. 5) then
            which = 'LI'
      else if (iwhich .eq. 6) then
            which = 'SI'
      else
		call intpr(' Error: Invalid mode.', -1, 0, 0)
c
        goto 9000
      end if
c
c
 10   continue
c
c        %---------------------------------------------%
c        | Repeatedly call the routine DNAUPD and take |
c        | actions indicated by parameter IDO until    |
c        | either convergence is indicated or maxitr   |
c        | has been exceeded.                          |
c        %---------------------------------------------%
c
         call dnaupd ( ido, bmat, n, which, maxnev, tol, resid,
     &        ncv, v, n, iparam, ipntr, workd, workl, lworkl,
     &        info )
c
      if (ido .eq. -1 .or. ido .eq. 1) then
c
            call d_ope (na, workd(ipntr(1)), workd(ipntr(2)),
     &                  a, ja, ia)
c
            go to 10
c
      end if
c
      if ( info .lt. 0 ) then
c
         call errpr (info)
c
         goto 9000
c
      else
c
         call dneupd ( .true., 'A', select, dr, di, v, n,
     &         sigmar, sigmai, workev, bmat, n, which, maxnev, tol,
     &         resid, ncv, v, n, iparam, ipntr, workd, workl,
     &         lworkl, ierr )
c
         if ( ierr .lt. 0 ) then
c
            call errpr (ierr)
c
            goto 9000
c
         end if
c
      endif
c 
 9000 continue
c
      end
c
c
