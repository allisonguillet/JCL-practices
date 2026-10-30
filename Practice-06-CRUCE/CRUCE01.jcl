//JOINKEYS  JOB (ACCT),'JOIN KEYS',CLASS=A,MSGCLASS=X,
//             NOTIFY=&SYSUID
//**********************************************************************
//* STEP1: DATASET DELETE IN CASE THEY ALREADY EXIST                   *
//**********************************************************************
//BORRADO  EXEC PGM=IEFBR14
//DD00001  DD DSN=Z80256.OUTPUT.JOINKEYS,
//            DISP=(MOD,DELETE),UNIT=SYSDA,SPACE=(TRK,0)
//**********************************************************************
//* STEP2: GENERATE DATASET (JOINKEYS)                                 *
//**********************************************************************
//JOINKEYS    EXEC PGM=SORT
//SYSOUT   DD SYSOUT=*
//SYSPRINT DD SYSOUT=*
//SORTJNF1   DD DSN=Z80256.INPUT(CLIENTS),DISP=SHR
//SORTJNF2   DD DSN=Z80256.INPUT(ACCOUNTS),DISP=SHR
//SORTOUT  DD DSN=Z80256.OUTPUT.JOINKEYS,
//             DISP=(,CATLG,DELETE),SPACE=(TRK,(5,2))
//SYSIN    DD *
  JOINKEYS FILE=F1,FIELDS=(1,4,A)
  JOINKEYS FILE=F2,FIELDS=(1,4,A)
  REFORMAT FIELDS=(F1:9,13,F2:5,18)
  SORT FIELDS=COPY
*