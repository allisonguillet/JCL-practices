//UNION01  JOB (ACCT),'UNION PRACTICE',CLASS=A,MSGCLASS=X,
//             NOTIFY=&SYSUID
//**********************************************************************
//* STEP1: DATASET DELETE IN CASE THEY ALREADY EXIST                   *
//**********************************************************************
//BORRADO  EXEC PGM=IEFBR14
//DD00001  DD DSN=Z80256.OUTPUT.UNION01,
//            DISP=(MOD,DELETE),UNIT=SYSDA,SPACE=(TRK,0)
//**********************************************************************
//* STEP2: GENERATE DATASET (UNION01)                                 *
//**********************************************************************
//UNION    EXEC PGM=SORT
//SYSOUT   DD SYSOUT=*
//SYSPRINT DD SYSOUT=*
//SORTIN   DD DSN=Z80256.INPUT(TRANSCRD),DISP=SHR
//         DD DSN=Z80256.INPUT(TRANSCD2),DISP=SHR
//SORTOUT  DD DSN=Z80256.OUTPUT.UNION01,
//             DISP=(,CATLG,DELETE),SPACE=(TRK,(5,2))
//SYSIN    DD *
  MERGE FIELDS=COPY
/*