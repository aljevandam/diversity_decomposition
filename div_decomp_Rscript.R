##This script is adjusted from the original file accompanying the data extract from IPUMS-USA. 
##Is writes the data extract to a .csv file containing columns: year, state, occ, ind, perwt

# NOTE: To load data, you must download both the extract's data and the DDI
# and also set the working directory to the folder with these files (or change the path below).

if (!require("ipumsr")) stop("Reading IPUMS data into R requires the ipumsr package. It can be installed using the following command: install.packages('ipumsr')")

ddi <- read_ipums_ddi("usa_00002.xml")
data <- read_ipums_micro(ddi)



data2 <-  data %>% group_by(YEAR,STATEICP,OCC1950,IND1950)  %>% summarize(PERWT_SUM = sum(PERWT))

write.csv(data2, 'IPUMS_ind_occ_state.csv', row.names=FALSE)