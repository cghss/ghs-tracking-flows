# Disbursed funds by pathway
This SQL query groups all funds disbursed between January 2016 and December 2022 by the transaction period (2016-2019 and 2020-2022), with a row for each stakeholder pathway. Stakeholders categories are described in the folder `data\stakeholder_categories`. 

A value of 0 means that no funds for this pathway were disbursed in a given period. Values are provided in nominal USD, and rounded to the nearest dollar.

This .csv is used to produce Figures 3a and 3b.
## Terminal command to run analysis
```bash
bash run.sh
```
