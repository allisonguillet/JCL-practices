# JCL Practices: Multi-Step Pipeline - Filtering & Formatting with DFSORT

## 📋 Job Overview
This practice demonstrates a complete multi-step **IBM DFSORT** pipeline in z/OS that automates dataset cleanup, **filters records** based on a specific date condition, and subsequently **formats/restructures** the output data using `OUTREC`, all within a single `SUBMIT`.

---

## ⚙️ Technical Specifications

- **`PGM=IEFBR14`**: Used in the initial step to safely delete pre-existing output datasets (`CREDOUT2` and `FRMTOUT1`) to prevent duplicate catalog errors (`IGD17101I`).
- **`PGM=SORT` (Step 2 - Filtering)**: 
  - `SORT FIELDS=COPY`: Copies records sequentially without reordering them.
  - `INCLUDE COND=(12,10,CH,GT,C'2026-05-01')`: Filters records where the date (starting at column 12, length 10) is greater than May 1, 2026.
- **`PGM=SORT` (Step 3 - Formatting)**:
  - `OUTREC FIELDS=(36,9,C',',1,10)`: Restructures the filtered records, extracting specific column positions and inserting a comma separator to generate the final formatted dataset (`FRMTOUT1`).
- **`SYSOUT=*` & `SYSPRINT`**: Directs runtime logs, diagnostics, and utility execution reports directly to the SDSF spool for monitoring.

---

## 📥 Input Dataset
- **DSN:** `Z80256.INPUT(TRANSCRD)`
- **Record Example:**
```text                                     
1234567890 2026-01-21 00015000 MXN APROBADA 
1235496822 2026-01-22 00007000 USD RECHAZADA
9852321000 2026-01-12 00900500 MXN FRAUDE   
1234567890 2026-08-21 00015000 MXN APROBADA 
1235496822 2026-05-13 00007000 USD RECHAZADA
5468444444 2026-05-05 00900500 MXN FRAUDE   
9698923546 2026-03-18 00015000 MXN APROBADA 
6662355544 2026-04-30 00007000 USD RECHAZADA
7894516330 2026-07-11 00900500 MXN FRAUDE   
```
---

## 🚀 Execution & Verification
1. Submit the job (FORMAT01) via VS Code using Zowe Explorer or TSO/ISPF SUBMIT.
2. Check SDSF to ensure the job completed successfully with return code CC 0000.
3. Inspect the output datasets Z80256.OUTPUT.CREDOUT2 (filtered records) and Z80256.OUTPUT.FRMTOUT1 (final formatted output).