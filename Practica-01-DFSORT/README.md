# Practice 1: Dataset Sorting using DFSORT

## 📌 Job Overview
JCL Job executing IBM's **DFSORT** utility to process and sort a transactional dataset in ascending order, using the leading character positions of each record as the sort key.

---

## ⚙️ Technical Specifications
* **Utility:** DFSORT (`PGM=SORT`)
* **Sort Logic:** `SORT FIELDS=(1,10,CH,A)` (Sorts by the first 10 characters in ascending order).
* **Dataset Organization:** FB (Fixed Block), `LRECL=80`.
* Z##### represents the user's High-Level Qualifier (HLQ). Replace it with your specific Mainframe User ID / HLQ.
---

## 📥 Input Dataset
* **DSN:** `Z#####.INPUT(TRANSCRD)`
* **Record Example:**
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
