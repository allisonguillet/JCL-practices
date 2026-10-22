//ORDER02A JOB (ACCT),'DFSORT PRACTICE',CLASS=A,MSGCLASS=X,
//             NOTIFY=&SYSUID
//**********************************************************************
//* PRACTICE 2: INCLUDE COND EXECUTION                                 *
//**********************************************************************
//SORT     EXEC PGM=SORT
//SYSOUT   DD SYSOUT=*
//SYSPRINT DD SYSOUT=*
//SORTIN   DD DSN=Z80256.INPUT(TRANSCRD),DISP=SHR
//SORTOUT  DD DSN=Z80256.OUTPUT.CREDOUT2,
//         DISP=(,CATLG,DELETE),SPACE=(TRK,(5,2))
//SYSIN    DD *
  SORT FIELDS=COPY
  INCLUDE COND=(12,10,CH,GT,C'2026-05-01')
/*