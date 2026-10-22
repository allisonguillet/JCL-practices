//ORDEN01A JOB (ACCT),'DFSORT PRACTICE',
//             CLASS=A,MSGCLASS=X,NOTIFY=&SYSUID
//**********************************************************************
//* PRACTICE 1: RECORD SORTING WITH DFSORT                             *
//**********************************************************************
//SORT     EXEC PGM=SORT
//SYSOUT   DD SYSOUT=*
//SORTIN   DD DSN=Z#####.INPUT(TRANSCRD),DISP=SHR
//SORTOUT  DD DSN=Z#####.OUTPUT.CREDOUT1,DISP=SHR
//SYSIN    DD *
  SORT FIELDS=(1,10,CH,A)
/*
