//ARITME01  JOB (ACCT),'JOIN KEYS',CLASS=A,MSGCLASS=X,
//             NOTIFY=&SYSUID
//**********************************************************************
//* STEP1: DATASET DELETE IN CASE THEY ALREADY EXIST                   *
//**********************************************************************
//BORRADO  EXEC PGM=IEFBR14
//DD00001  DD DSN=Z80256.OUTPUT.SALARY,
//            DISP=(MOD,DELETE),UNIT=SYSDA,SPACE=(TRK,0)
//**********************************************************************
//* STEP2: GENERATE DATASET (SALARY)                                 *
//**********************************************************************
//CALCULO  EXEC PGM=SORT
//SYSOUT   DD SYSOUT=*
//SYSPRINT DD SYSOUT=*
//SORTIN   DD DSN=Z80256.INPUT(EMPLOYEE),DISP=SHR
//SORTOUT  DD DSN=Z80256.OUTPUT.SALARY,DISP=(,CATLG,DELETE),
//             SPACE=(TRK,(5,2))
//SYSIN    DD *
  SORT FIELDS=COPY
  OUTREC FIELDS=(1,24,
                 C' - Total: ',
                 25,6,ZD,ADD,31,4,ZD,TO=ZD,LENGTH=6)
/*