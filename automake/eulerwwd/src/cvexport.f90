SUBROUTINE CVEXPORT
 USE DAMOD
	REAL::M,plot(5,nde)
    DO I=1,NCELLS
    DEN=W(1,I)
	U=W(2,I)/W(1,I)
	V=W(3,I)/W(1,I)
	ENERGY=W(4,I)/W(1,I)
	H=ENERGY+(GAMA-1)*(ENERGY-0.5*(U**2+V**2))
	PRESURE=DEN*(H-ENERGY)
	SONIC=SQRT(GAMA*(H-ENERGY))
	M=SQRT(U**2+V**2)/SONIC
	PLOT(1,I)=DEN;PLOT(2,I)=PRESURE;PLOT(3,I)=U;PLOT(4,I)=V;PLOT(5,I)=M
	ENDDO
	OPEN(5,FILE='cvnaca0012.PLT',FORM='FORMATTED')
	WRITE(5,*)'TITLE = "CVSTEADY"'
	WRITE(5,*)'VARIABLES= "X","Y","DEN","P","U","V","MA"'
	WRITE(5,*)'ZONE N=',nde,',E=',nel,',F=FEPOINT,ET=TRIANGLE'
	WRITE(5,71)((mend(J,I),J=1,2),(PLOT(K,I),K=1,5),I=1,nde)
	WRITE(5,32)((cell(J,I),J=1,3),I=1,nel)
	CLOSE(5)
	PRINT*,'cv exported '
2     FORMAT(A7)
21    FORMAT(2E15.7)
32    FORMAT(3I7)
41    FORMAT(4E15.7)
71    FORMAT(7E15.7)
46    FORMAT(3E15.7)
END
! OPEN(5,FILE='(CV)LCP.PLT')
! 	WRITE(5,21)((EXNODE(1,I),(PLOT(2,I)-P8)*2.),I=1,76)
! 	CLOSE(5)
! 	OPEN(5,FILE='(CV)UCP.PLT')
! 	WRITE(5,21)0.,(PLOT(2,1)-P8)*2.
! 	WRITE(5,21)((EXNODE(1,152-I),(PLOT(2,152-I)-P8)*2.),I=2,76)
! 	CLOSE(5)
! OPEN(1,FILE='(cv)CL&CD.DAT',FORM='FORMATTED')
! 	CL=0.
! 	CD=0.
! 	SB=SIN(ALPHA)
! 	CB=COS(ALPHA)
!  DO I=1,NEDGES
!  IF(EDGE(5,I).EQ.1)THEN
!     A=EDGE(1,I)
! 	B=EDGE(2,I)
! 	DX=NODE(1,B)-NODE(1,A)
! 	DY=NODE(2,B)-NODE(2,A)
!     J=EDGE(3,I)
!     DEN=W(1,J)
! 	U=W(2,J)/W(1,J)
! 	V=W(3,J)/W(1,J)
! 	E=W(4,J)/W(1,J)
! 	PJ=(GAMA-1)*DEN*(E-0.5*(U**2+V**2))
!     CL=CL-PJ*DX
! 	CD=CD+PJ*DY
!  ENDIF
!  ENDDO
!     RCL=(CL*COS(ALPHA)-CD*SIN(ALPHA))*2.
! 	RCD=(CL*SIN(ALPHA)+CD*COS(ALPHA))*2.
!  WRITE(1,46)ALPHA/TT*180.,RCL,RCD    !����CL&CD
!  CLOSE(1)
