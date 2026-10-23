//FORMAT01 JOB (ACCT),'FORMAT PRACTICE',CLASS=A,MSGCLASS=X,
//             NOTIFY=&SYSUID
//**********************************************************************
//* STEP1: DATASET DELETE IN CASE THEY ALREADY EXIST                   *
//**********************************************************************
//BORRADO  EXEC PGM=IEFBR14
//DD00001  DD DSN=Z80256.OUTPUT.CREDOUT2,
//            DISP=(MOD,DELETE),UNIT=SYSDA,SPACE=(TRK,0)
//DD00002  DD DSN=Z80256.OUTPUT.FRMTOUT1,
//            DISP=(MOD,DELETE),UNIT=SYSDA,SPACE=(TRK,0)
//**********************************************************************
//* STEP2: GENERATE DATASET (CREDOUT2)                                 *
//**********************************************************************
//STEP2    EXEC PGM=SORT
//SYSOUT   DD SYSOUT=*
//SYSPRINT DD SYSOUT=*
//SORTIN   DD DSN=Z80256.INPUT(TRANSCRD),DISP=SHR
//SORTOUT  DD DSN=Z80256.OUTPUT.CREDOUT2,
//             DISP=(,CATLG,DELETE),SPACE=(TRK,(5,2))
//SYSIN    DD *
  SORT FIELDS=COPY
  INCLUDE COND=(12,10,CH,GT,C'2026-05-01')
/*
//**********************************************************************
//* SETP3: OUTREC EXECUTION - FORMAT OUTPUT DATASET                    *
//**********************************************************************
//SORT     EXEC PGM=SORT
//SYSOUT   DD SYSOUT=*
//SYSPRINT DD SYSOUT=*
//SORTIN   DD DSN=Z80256.OUTPUT.CREDOUT2,DISP=SHR
//SORTOUT  DD DSN=Z80256.OUTPUT.FRMTOUT1,
//         DISP=(,CATLG,DELETE),SPACE=(TRK,(5,2))
//SYSIN    DD *
  SORT FIELDS=COPY
  OUTREC FIELDS=(36,9,C',',1,10)
/*
