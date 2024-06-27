# ghs-tracking-flows
Robertson et al. Follow the Money: A Global Analysis of Funding Dynamics for Global Health Security. Preprint available at: https://papers.ssrn.com/sol3/papers.cfm?abstract_id=4709948. Peer-reviewed publication available at: https://doi.org/10.1093/haschl/qxae083.

This repository contains all code and analysis for the paper, and provides static data from the Global Health Security Tracking database [(tracking.ghscosting.org)](https://tracking.ghscosting.org/)

## Getting started
This repository is organized into four folders: [`data`](./data/), [`figures`](./figures/), [`scripts`](./scripts/), and [`util`](./util/). The [`data`](./data/) folder contains sub-folders, each with their own code and results. 

Running the queries is not necessary to reproduce visualized results, as the results from the queries (and the full database) are provided as .csv files. 

However, if you wish to run queries, access to the GHS Tracking database server is required. The [`util`](./util/) folder is used to run the queries from terminal. Access to the GHS Tracking database server is required for this action, along with a configured `~/.pg_service.conf` file is required. Please reach out to us at [outbreaks@georgetown.edu](mailto:outbreaks@georgetown.edu) for more information.

## Running queries
The directory [`data`](./data/) contains one directory per query. Each of those contains a `README.md` detailing the query. The code folders contain the individual SQL queries run to retrieve data from the GHS Tracking database server. The results folders contain the output .csv files. These data are the ones that power the visualization and figures, with code stored in the [`scripts`](./scripts/) folder.

A static version of the database used for this analyais has been provided in the folder `data/Static GHS Tracking database`. Data was last updated in December 2022.

## Creating visualizations
The directory [`scripts`](./scripts/) contains an .ipynb file, organized with headings and sub-headings per figure. To run this file, install all package requirements using pip or your preferred package installer. You may need to restart the kernel to access the packages. 

If you wish to use the OpenSans font, install it [(here)](https://fonts.google.com/specimen/Open+Sans) to your system and configure the variable font_dir to your Font Library. Otherwise, comment this section out and your default system font will be used. No other modifications are required to run the script. 

The output figures will be added to the [`figures`](./figures/) file. 
