//SINDUPLI  JOB (ACCT),'DELETE DUPLICATES',CLASS=A,MSGCLASS=X,
//             NOTIFY=&SYSUID
//**********************************************************************
//* STEP1: DATASET DELETE IN CASE THEY ALREADY EXIST                   *
//**********************************************************************
//BORRADO  EXEC PGM=IEFBR14
//DD00001  DD DSN=Z80256.OUTPUT.SINDUPLI,
//            DISP=(MOD,DELETE),UNIT=SYSDA,SPACE=(TRK,0)
//**********************************************************************
//* STEP2: GENERATE DATASET (SINDUPLI)                                 *
//**********************************************************************
//UNION    EXEC PGM=SORT
//SYSOUT   DD SYSOUT=*
//SYSPRINT DD SYSOUT=*
//SORTIN   DD DSN=Z80256.INPUT(COMPANY),DISP=SHR
//SORTOUT  DD DSN=Z80256.OUTPUT.SINDUPLI,
//             DISP=(,CATLG,DELETE),SPACE=(TRK,(5,2))
//SYSIN    DD *
  SORT FIELDS=(1,16,CH,A)
  SUM FIELDS=NONE
/*