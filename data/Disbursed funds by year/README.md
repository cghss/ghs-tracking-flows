# Disbursed funds by year
This SQL query groups all funds disbursed between January 2016 and December 2022 by the transaction year, with a column for whether the transaction had specified core capacities or was unspecified (for capacity flows), or for response.  All stakeholders are included. A value of 0 means that no funds for this category were disbursed in a given year. Values are provided in nominal USD, and rounded to the nearest dollar.

This .csv is used to produce Figure 1a.

## Terminal command to run analysis
```bash
bash run.sh
```
