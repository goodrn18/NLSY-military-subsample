
# Set working directory
# setwd()


new_data <- read.table('Military-Subsample_Alcohol.dat', sep=' ')
names(new_data) <- c('R0000100',
  'R0029800',
  'R0030400',
  'R0030500',
  'R0031100',
  'R0034300',
  'R0036100',
  'R0038400',
  'R0040500',
  'R0173600',
  'R0214700',
  'R0214800',
  'R0236500',
  'R0241900',
  'R0242700',
  'R0247500',
  'R0248400',
  'R0253300',
  'R0260300',
  'R0424700',
  'R0430000',
  'R0430800',
  'R0435600',
  'R0436500',
  'R0441400',
  'R0443300',
  'R0671400',
  'R0672000',
  'R0677700',
  'R0678500',
  'R0685600',
  'R0686500',
  'R0691500',
  'R0691900',
  'R0692300',
  'R0693400',
  'R0780200',
  'R0780400',
  'R0781100',
  'R0913200',
  'R0913800',
  'R0919400',
  'R0920200',
  'R0927400',
  'R0928500',
  'R0933700',
  'R0934100',
  'R0934500',
  'R0936400',
  'R1021700',
  'R1022000',
  'R1022100',
  'R1023600',
  'R1221900',
  'R1222500',
  'R1228900',
  'R1230000',
  'R1238200',
  'R1243500',
  'R1243900',
  'R1244300',
  'R1246700',
  'R1391200',
  'R1391300',
  'R1391400',
  'R1392900',
  'R1393400',
  'R1393500',
  'R1393600',
  'R1393700')


# Handle missing values

  new_data[new_data == -1] = NA  # Refused 
  new_data[new_data == -2] = NA  # Dont know 
  new_data[new_data == -3] = NA  # Invalid missing 
  new_data[new_data == -4] = NA  # Valid missing 
  new_data[new_data == -5] = NA  # Non-interview 


# If there are values not categorized they will be represented as NA

vallabels = function(data) {
  data$R0029800 <- factor(data$R0029800, 
    levels=c(1.0,2.0,3.0), 
    labels=c("SERVED IN 1 BRANCH",
      "SERVED IN ACTIVE & RESERVE",
      "DELAYED SERVICE"))
  data$R0030400 <- factor(data$R0030400, 
    levels=c(0.0,1.0), 
    labels=c("NO",
      "YES"))
  data$R0030500 <- factor(data$R0030500, 
    levels=c(0.0,1.0), 
    labels=c("NO",
      "YES"))
  data$R0031100 <- factor(data$R0031100, 
    levels=c(0.0,1.0), 
    labels=c("NO",
      "YES"))
  data$R0034300 <- factor(data$R0034300, 
    levels=c(0.0,1.0), 
    labels=c("NO",
      "YES"))
  data$R0036100 <- factor(data$R0036100, 
    levels=c(1.0,2.0,3.0), 
    labels=c("SERVING IN ACTIVE FORCES",
      "SERVING IN RESERVE/GUARD",
      "NOT SERVING AT ALL"))
  data$R0038400 <- factor(data$R0038400, 
    levels=c(1.0,2.0,3.0), 
    labels=c("ACTIVE STATUS",
      "RESERVE STATUS",
      "NOT SERVING"))
  data$R0040500 <- factor(data$R0040500, 
    levels=c(0.0,1.0), 
    labels=c("NO",
      "YES"))
  data$R0173600 <- factor(data$R0173600, 
    levels=c(1.0,2.0,3.0,4.0,5.0,6.0,7.0,8.0,9.0,10.0,11.0,12.0,13.0,14.0,15.0,16.0,17.0,18.0,19.0,20.0), 
    labels=c("CROSS MALE WHITE",
      "CROSS MALE WH. POOR",
      "CROSS MALE BLACK",
      "CROSS MALE HISPANIC",
      "CROSS FEMALE WHITE",
      "CROSS FEMALE WH POOR",
      "CROSS FEMALE BLACK",
      "CROSS FEMALE HISPANIC",
      "SUP MALE WH POOR",
      "SUP MALE BLACK",
      "SUP MALE HISPANIC",
      "SUP FEM WH POOR",
      "SUP FEMALE BLACK",
      "SUP FEMALE HISPANIC",
      "MIL MALE WHITE",
      "MIL MALE BLACK",
      "MIL MALE HISPANIC",
      "MIL FEMALE WHITE",
      "MIL FEMALE BLACK",
      "MIL FEMALE HISPANIC"))
  data$R0214700 <- factor(data$R0214700, 
    levels=c(1.0,2.0,3.0), 
    labels=c("HISPANIC",
      "BLACK",
      "NON-BLACK, NON-HISPANIC"))
  data$R0214800 <- factor(data$R0214800, 
    levels=c(1.0,2.0), 
    labels=c("MALE",
      "FEMALE"))
  data$R0236500 <- factor(data$R0236500, 
    levels=c(0.0,1.0), 
    labels=c("NO",
      "YES"))
  data$R0241900 <- factor(data$R0241900, 
    levels=c(0.0,1.0), 
    labels=c("NO",
      "YES"))
  data$R0242700 <- factor(data$R0242700, 
    levels=c(0.0,1.0), 
    labels=c("NO",
      "YES"))
  data$R0247500 <- factor(data$R0247500, 
    levels=c(0.0,1.0), 
    labels=c("NO",
      "YES"))
  data$R0248400 <- factor(data$R0248400, 
    levels=c(0.0,1.0), 
    labels=c("NO",
      "YES"))
  data$R0253300 <- factor(data$R0253300, 
    levels=c(0.0,1.0), 
    labels=c("NO",
      "YES"))
  data$R0260300 <- factor(data$R0260300, 
    levels=c(0.0,1.0), 
    labels=c("NO",
      "YES"))
  data$R0424700 <- factor(data$R0424700, 
    levels=c(0.0,1.0), 
    labels=c("NO",
      "YES"))
  data$R0430000 <- factor(data$R0430000, 
    levels=c(0.0,1.0), 
    labels=c("NO",
      "YES"))
  data$R0430800 <- factor(data$R0430800, 
    levels=c(0.0,1.0), 
    labels=c("NO",
      "YES"))
  data$R0435600 <- factor(data$R0435600, 
    levels=c(0.0,1.0), 
    labels=c("NO",
      "YES"))
  data$R0436500 <- factor(data$R0436500, 
    levels=c(0.0,1.0), 
    labels=c("NO",
      "YES"))
  data$R0441400 <- factor(data$R0441400, 
    levels=c(0.0,1.0), 
    labels=c("NO",
      "YES"))
  data$R0443300 <- factor(data$R0443300, 
    levels=c(0.0,1.0), 
    labels=c("NO",
      "YES"))
  data$R0671400 <- factor(data$R0671400, 
    levels=c(0.0,1.0), 
    labels=c("NO",
      "YES"))
  data$R0672000 <- factor(data$R0672000, 
    levels=c(0.0,1.0), 
    labels=c("NO",
      "YES"))
  data$R0677700 <- factor(data$R0677700, 
    levels=c(0.0,1.0), 
    labels=c("NO",
      "YES"))
  data$R0678500 <- factor(data$R0678500, 
    levels=c(0.0,1.0), 
    labels=c("NO",
      "YES"))
  data$R0685600 <- factor(data$R0685600, 
    levels=c(0.0,1.0), 
    labels=c("NO",
      "YES"))
  data$R0686500 <- factor(data$R0686500, 
    levels=c(0.0,1.0), 
    labels=c("NO",
      "YES"))
  data$R0691500 <- factor(data$R0691500, 
    levels=c(0.0,1.0), 
    labels=c("NO",
      "YES"))
  data$R0691900 <- factor(data$R0691900, 
    levels=c(0.0,1.0), 
    labels=c("NO",
      "YES"))
  data$R0692300 <- factor(data$R0692300, 
    levels=c(0.0,1.0), 
    labels=c("NO",
      "YES"))
  data$R0693400 <- factor(data$R0693400, 
    levels=c(0.0,1.0), 
    labels=c("NO",
      "YES"))
#  data$R0780200[0.0 <= data$R0780200 & data$R0780200 <= 10.0] <- 0.0
#  data$R0780200[27.0 <= data$R0780200 & data$R0780200 <= 99999.0] <- 27.0
#  data$R0780200 <- factor(data$R0780200, 
#    levels=c(0.0,11.0,12.0,13.0,14.0,15.0,16.0,17.0,18.0,19.0,20.0,21.0,22.0,23.0,24.0,25.0,26.0,27.0), 
#    labels=c("0 TO 10: < 11",
#      "11",
#      "12",
#      "13",
#      "14",
#      "15",
#      "16",
#      "17",
#      "18",
#      "19",
#      "20",
#      "21",
#      "22",
#      "23",
#      "24",
#      "25",
#      "26",
#      "27 TO 99999: 27+"))
  data$R0780400 <- factor(data$R0780400, 
    levels=c(0.0,1.0,2.0,3.0,4.0,5.0,6.0), 
    labels=c("NEVER",
      "ONCE",
      "2 OR 3 TIMES",
      "4 OR 5 TIMES",
      "6 OR 7 TIMES",
      "8 OR 9 TIMES",
      "10 OR MORE TIMES"))
  data$R0781100 <- factor(data$R0781100, 
    levels=c(0.0,1.0), 
    labels=c("NO",
      "YES"))
  data$R0913200 <- factor(data$R0913200, 
    levels=c(0.0,1.0), 
    labels=c("NO",
      "YES"))
  data$R0913800 <- factor(data$R0913800, 
    levels=c(0.0,1.0), 
    labels=c("NO",
      "YES"))
  data$R0919400 <- factor(data$R0919400, 
    levels=c(0.0,1.0), 
    labels=c("NO",
      "YES"))
  data$R0920200 <- factor(data$R0920200, 
    levels=c(0.0,1.0), 
    labels=c("NO",
      "YES"))
  data$R0927400 <- factor(data$R0927400, 
    levels=c(0.0,1.0), 
    labels=c("NO",
      "YES"))
  data$R0928500 <- factor(data$R0928500, 
    levels=c(0.0,1.0), 
    labels=c("NO",
      "YES"))
  data$R0933700 <- factor(data$R0933700, 
    levels=c(0.0,1.0), 
    labels=c("NO",
      "YES"))
  data$R0934100 <- factor(data$R0934100, 
    levels=c(0.0,1.0), 
    labels=c("NO",
      "YES"))
  data$R0934500 <- factor(data$R0934500, 
    levels=c(0.0,1.0), 
    labels=c("NO",
      "YES"))
  data$R0936400 <- factor(data$R0936400, 
    levels=c(0.0,1.0), 
    labels=c("NO",
      "YES"))
#  data$R1021700[0.0 <= data$R1021700 & data$R1021700 <= 9.0] <- 0.0
# data$R1021700[26.0 <= data$R1021700 & data$R1021700 <= 99999.0] <- 26.0
#  data$R1021700 <- factor(data$R1021700, 
#    levels=c(0.0,10.0,11.0,12.0,13.0,14.0,15.0,16.0,17.0,18.0,19.0,20.0,21.0,22.0,23.0,24.0,25.0,26.0), 
#    labels=c("0 TO 9: < 10",
#      "10",
#      "11",
#      "12",
#      "13",
#      "14",
#      "15",
#      "16",
#      "17",
#      "18",
#      "19",
#      "20",
#      "21",
#      "22",
#      "23",
#      "24",
#      "25",
#      "26 TO 99999: 26+"))
  data$R1022000 <- factor(data$R1022000, 
    levels=c(0.0,1.0,2.0,3.0,4.0,5.0,6.0), 
    labels=c("NEVER",
      "ONCE",
      "2 OR 3 TIMES",
      "4 OR 5 TIMES",
      "6 OR 7 TIMES",
      "8 OR 9 TIMES",
      "10 OR MORE TIMES"))
#  data$R1022100[16.0 <= data$R1022100 & data$R1022100 <= 99999.0] <- 16.0
#  data$R1022100 <- factor(data$R1022100, 
#    levels=c(0.0,1.0,2.0,3.0,4.0,5.0,6.0,7.0,8.0,9.0,10.0,11.0,12.0,13.0,14.0,15.0,16.0), 
#    labels=c("0",
#      "1",
#      "2",
#      "3",
#      "4",
#      "5",
#      "6",
#      "7",
#      "8",
#      "9",
#      "10",
#      "11",
#      "12",
#      "13",
#      "14",
#      "15",
#      "16 TO 99999: 16+"))
  data$R1023600 <- factor(data$R1023600, 
    levels=c(0.0,1.0), 
    labels=c("NO",
      "YES"))
  data$R1221900 <- factor(data$R1221900, 
    levels=c(0.0,1.0), 
    labels=c("NO",
      "YES"))
  data$R1222500 <- factor(data$R1222500, 
    levels=c(0.0,1.0), 
    labels=c("NO",
      "YES"))
  data$R1228900 <- factor(data$R1228900, 
    levels=c(0.0,1.0), 
    labels=c("NO",
      "YES"))
  data$R1230000 <- factor(data$R1230000, 
    levels=c(0.0,1.0), 
    labels=c("NO",
      "YES"))
  data$R1238200 <- factor(data$R1238200, 
    levels=c(0.0,1.0), 
    labels=c("NO",
      "YES"))
  data$R1243500 <- factor(data$R1243500, 
    levels=c(0.0,1.0), 
    labels=c("NO",
      "YES"))
  data$R1243900 <- factor(data$R1243900, 
    levels=c(0.0,1.0), 
    labels=c("NO",
      "YES"))
  data$R1244300 <- factor(data$R1244300, 
    levels=c(0.0,1.0), 
    labels=c("NO",
      "YES"))
  data$R1246700 <- factor(data$R1246700, 
    levels=c(0.0,1.0), 
    labels=c("NO",
      "YES"))
  data$R1391200 <- factor(data$R1391200, 
    levels=c(0.0,1.0), 
    labels=c("NO",
      "YES"))
  data$R1391300 <- factor(data$R1391300, 
    levels=c(0.0,1.0,2.0,3.0,4.0,5.0,6.0), 
    labels=c("NEVER",
      "ONCE",
      "2 OR 3 TIMES",
      "4 OR 5 TIMES",
      "6 OR 7 TIMES",
      "8 OR 9 TIMES",
      "10 OR MORE TIMES"))
#  data$R1391400[16.0 <= data$R1391400 & data$R1391400 <= 99999.0] <- 16.0
#  data$R1391400 <- factor(data$R1391400, 
#    levels=c(0.0,1.0,2.0,3.0,4.0,5.0,6.0,7.0,8.0,9.0,10.0,11.0,12.0,13.0,14.0,15.0,16.0), 
#    labels=c("0",
#      "1",
#      "2",
#      "3",
#      "4",
#      "5",
#      "6",
#      "7",
#      "8",
#      "9",
#      "10",
#      "11",
#      "12",
#      "13",
#      "14",
#      "15",
#      "16 TO 99999: 16+"))
  data$R1392900 <- factor(data$R1392900, 
    levels=c(0.0,1.0), 
    labels=c("NO",
      "YES"))
  data$R1393400 <- factor(data$R1393400, 
    levels=c(0.0,1.0), 
    labels=c("NO",
      "YES"))
  data$R1393500 <- factor(data$R1393500, 
    levels=c(0.0,1.0), 
    labels=c("NO",
      "YES"))
  data$R1393600 <- factor(data$R1393600, 
    levels=c(0.0,1.0), 
    labels=c("NO",
      "YES"))
  data$R1393700 <- factor(data$R1393700, 
    levels=c(0.0,1.0), 
    labels=c("NO",
      "YES"))
  return(data)
}

varlabels <- c("ID# (1-12686) 79",
  "ICHK SERVED BOTH ACTIVE AF AND GARD 79",
  "ICHK IN AAF M-RCNT ENLSTMNT 79",
  "ICHK IN AAF 2ND M-RCNT ENLSTMNT 79",
  "IN AAF M-RCNT PRD OF SRVC 79",
  "ICHK R CURRENTLY ON AAF DUTY 79",
  "ICHK R CURRENTLY ON AAF DUTY 79",
  "ICHK R CURRENTLY ON AAF DUTY 79",
  "ICHK CURRENTLY AAF RESERVES/GARD 79",
  "SAMPLE ID  79 INT",
  "RACL/ETHNIC COHORT /SCRNR 79",
  "SEX OF R 79",
  "ICHK R IN AAF @ LINT 80",
  "ICHK R ENTER AAF M-RCNT ENLSTMNT 80",
  "ICHK R CURRENTLY IN AAF 80",
  "ICHK R IN AAF @ LINT 80",
  "ICHK R CURRENTLY IN AAF 80",
  "TIME SERVE ACT AF (NOT CUR ENLSTD) 80",
  "ICHK R CURRENTLY ON AAF DUTY 80",
  "ICHK R IN AAF @ LINT 81",
  "ICHK R ENTER AAF M-RCNT ENLSTMNT 81",
  "ICHK R CURRENTLY IN AAF 81",
  "ICHK R IN AAF @ LINT 81",
  "ICHK R CURRENTLY IN AAF 81",
  "TIME SERVE ACT AF (NOT CUR ENLSTD) 81",
  "ICHK R CURRENTLY ON AAF DUTY 81",
  "ICHK IN AAF @ LINT SAME BRANCH 82",
  "ICHK R IN AAF @ LINT 82",
  "ICHK R ENTER AAF M-RCNT ENLSTMNT 82",
  "ICHK R CURRENTLY IN AAF 82",
  "ICHK R IN AAF @ LINT 82",
  "ICHK R CURRENTLY IN AAF 82",
  "TIME SERVE ACT AF (NOT CUR ENLSTD) 82",
  "ICHK DID ENTER AAF NOT NOW ENLSTD 82",
  "ICHK R IN THE AAF (NOT NOW ENLSTD) 82",
  "ICHK R CURRENTLY ON AAF DUTY 82",
  "ALCHL-AGE START DRNK 82",
  "ALCHL-FREQ 6/> DRNK @ 1 TM LAST MO 82",
  "ALCHL-DRNK INTERFERE W/JOB 82",
  "ICHK R ACT ARM FORCE LINT SAME 83",
  "ICHK R IN AAF @ LINT 83",
  "ICHK R ENTER AAF M-RCNT ENLSTMNT 83",
  "ICHK R CURRENTLY IN AAF 83",
  "ICHK R IN AAF @ LINT 83",
  "ICHK R CURRENTLY IN AAF 83",
  "TIME SERVE ACT AF (NOT CUR ENLSTD) 83",
  "ICHK DID ENTER AAF NOT NOW ENLSTD 83",
  "ICHK R IN THE AAF (NOT NOW ENLSTD) 83",
  "ICHK R CURRENTLY ON AAF DUTY 83",
  "ALCHL-AGE START DRNK 83",
  "ALCHL-FREQ 6/> DRNK @ 1 TM LAST MO 83",
  "ALCHL-#DAYS DRANK ALCOHOL LAST MO 83",
  "ALCHL-DRNK INTERFERE W/JOB 83",
  "ICHK IN AAF @ LINT SAME BR AS @ LINT 84",
  "ICHK R IN AAF @ LINT 84",
  "ICHK R ENTER AAF M-RCNT ENLSTMNT 84",
  "ICHK R CURRENTLY IN AAF 84",
  "ICHK R CURRENTLY IN AAF 84",
  "TIME SERVE ACT AF (NOT CUR ENLSTD) 84",
  "ICHK DID ENTER AAF NOT NOW ENLSTD 84",
  "ICHK R IN THE AAF (NOT NOW ENLSTD) 84",
  "ICHK R CURRENTLY ON AAF DUTY 84",
  "ALCHL-DRNK INTERFERE W/JOB 84",
  "ALCHL-FREQ 6/> DRNK @ 1 TM LAST MO 84",
  "ALCHL-#DAYS DRANK ALCOHOL LAST MO 84",
  "ALCHL-DRNK INTERFERE W/JOB 84",
  "ALCHL-AFRAID BE/BECOME ALCHLC 84",
  "ALCHL-DIFF STOP DRNK UNTIL INTOX 84",
  "ALCHL-DONT REMEMBER THING WHILE DRNK 84",
  "ALCHL-TAKE DRNK 1ST THING MORN 84"
)


# Use qnames rather than rnums
#Change these names to be useful
#AD = ACTIVE DUTY
#ARNG= ACTIVE RESERVE NATIONAL GUARD
qnames = function(data) {
  names(data) <- c("CASEID",
    "AD_AND_ARNG_79",
    "AD_RECENT_ENLIST_79",
    "AD_2NDRECENT_ENLIST_79",
    "AD_RECENT_SERVICEPERIOD_79",
    "CURRENT_AD_YN_79",
    "CURRENT_AD_ARNG_79",
    "CURRENT_AD_ARNG_STATUS_79",
    "CURRENT_AD_ARNG_YN_79",
    "SAMPLE_ID_79",
    "RACE",
    "SAMPLE_SEX_79",
    "AD_LAST_INT_NOTSAME_BRANCH_80",
    "NEW_ENLIST_AD_80",
    "CURRENT_AD_YN_80",#CONFUSION_Q4-15
    "AD_LAST_INT_SAME_BRANCH_80",
    "CURRENT_AD_YN_80_Q2",#CONFUSION_MIL-59
    "TIME_SERVED_YN_80",
    "CURRENT_AD_YN_80", #CONFUSION_MIL-48
    "AD_LAST_INT_NOTSAME_BRANCH_81",
    "NEW_ENLIST_AD_81",
    "CURRENT_AD_YN_81",#CONFUSION_Q4-15
    "AD_LAST_INT_SAME_BRANCH_81",
    "CURRENT_AD_YN_81_Q2",#CONFUSION_MIL-59
    "TIME_SERVED_YN_81",
    "CURRENT_AD_YN_81", #CONFUSION_MIL-48
    "AD_LAST_INT_SAME_BRANCH_82",
    "AD_LAST_INT_NOTSAME_BRANCH_82",
    "NEW_ENLIST_AD_82",
    "CURRENT_AD_YN_82",#CONFUSION_Q4-15
    "AD_LAST_INT_SAME_BRANCH_82",
    "CURRENT_AD_YN_82_Q2",#CONFUSION_MIL-59
    "TIME_SERVED_YN_82",
    "MIL-100_1982",
    "Q4-12A_1982",
    "MIL-48_1982",
    "ALCH-2_1982",
    "Q12-4_1982",
    "ALCH-11_1982",
    "Q4-4A_1983",
    "MIL-15_1983",
    "Q4-11_1983",
    "Q4-15_1983",
    "MIL-13_1983",
    "MIL-59_1983",
    "Q4-12_1983",
    "MIL-100_1983",
    "Q4-12A_1983",
    "MIL-48_1983",
    "ALCH-2_1983",
    "Q12-4_1983",
    "Q12-5_1983",
    "ALCH-11_1983",
    "Q4-4A_1984",
    "MIL-15_1984",
    "Q4-11_1984",
    "Q4-15_1984",
    "MIL-59_1984",
    "Q4-12_1984",
    "MIL-100_1984",
    "Q4-12A_1984",
    "MIL-48_1984",
    "ALCH-17_1984",
    "Q12-4_1984",
    "Q12-5_1984",
    "ALCH-11_1984",
    "ALCH-18E_1984",
    "ALCH-18F_1984",
    "ALCH-18G_1984",
    "ALCH-18H_1984")
  return(data)
}


#********************************************************************************************************

# Remove the '#' before the following line to create a data file called "categories" with value labels. 
#categories <- vallabels(new_data)

# Remove the '#' before the following lines to rename variables using Qnames instead of Reference Numbers
#new_data <- qnames(new_data)

df_data <- qnames(vallabels(new_data))

# Produce summaries for the raw (uncategorized) data file
summary(df_data)

# Remove the '#' before the following lines to produce summaries for the "categories" data file.
#categories <- vallabels(new_data)
#summary(categories)

#************************************************************************************************************

