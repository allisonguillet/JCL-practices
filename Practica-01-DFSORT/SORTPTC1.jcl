//ORDEN01A JOB (ACCT),NOTIFY=&SYSUID
//**********************************************************************
//* PRACTICA 1: ORDENAMIENTO DE REGISTROS CON DFSORT                   *
//* Ordenar el archivo por el numero de tarjeta de forma ascendente    *
//* y por monto de forma descendente.                                  *
//**********************************************************************
//SORT     EXEC PGM=SORT
//SYSOUT   DD SYSOUT=*
//SORTIN   DD DSN=Z#####.INPUT(TRANSCRD),DISP=SHR
//SORTOUT  DD DSN=Z#####.OUTPUT(CREDOUT1),DISP=SHR
//SYSIN    DD *
  SORT FIELDS=(1,10,CH,A)
/*
