MODULE DAMOD
CHARACTER*2::CV
INTEGER::NNODES,NCELLS,NEDGES,nde,nel,neg
REAL,PARAMETER::TT=3.141592654,CFL=2.,ALFA1=1/4.,ALFA2=1/3.,ALFA3=0.5,ALFA4=1.,&
K2=0.8,K4=1/32.,GAMA=1.4,MACH=0.8,GASC=8.3145
REAL::DEN8,P8,SONIC8,U8,V8,E8,W18,W28,W38,W48,ALPHA,FIRSTR2
REAL,ALLOCATABLE::NODE(:,:),W(:,:),INIR(:,:),RES(:,:),mend(:,:)
INTEGER,ALLOCATABLE::EDGE(:,:),CELL(:,:),meeg(:,:)
END MODULE DAMOD
!-----------------------------------------------------------
MODULE FD
REAL,ALLOCATABLE::SONIC(:),Z(:)
END MODULE FD
!--------------------------------
