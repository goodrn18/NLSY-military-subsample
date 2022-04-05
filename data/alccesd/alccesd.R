
# Set working directory
# setwd()


new_data <- read.table('alccesd.dat', sep=' ')
names(new_data) <- c('H0001101',
'R0000100',
'R0173600',
'R0214700',
'R0214800',
'R3896820',
'R3914800',
'R3914900',
'R4978910',
'R4979300',
'R4979400',
'R4979500',
'T4914700')


# Handle missing values

new_data[new_data == -1] = NA  # Refused
new_data[new_data == -2] = NA  # Dont know
new_data[new_data == -3] = NA  # Invalid missing
new_data[new_data == -4] = NA  # Valid missing
new_data[new_data == -5] = NA  # Non-interview


# If there are values not categorized they will be represented as NA

vallabels = function(data) {
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
  data$R3914800 <- factor(data$R3914800,
levels=c(0.0,1.0,2.0,3.0,4.0,5.0),
labels=c("NOT AT ALL IN THE LAST 30 DAYS",
"EVERY DAY",
"5-6 DAYS PER WEEK",
"3-4 DAYS PER WEEK",
"1-2 DAYS PER WEEK",
"LESS OFTEN THAN ONCE PER WEEK"))
  data$R4979300 <- factor(data$R4979300,
levels=c(0.0,1.0,2.0,3.0,4.0,5.0,6.0),
labels=c("Never",
"Once",
"2 or 3 times",
"4 or 5 times",
"6 or 7 times",
"8 or 9 times",
"10 or more times"))
return(data)
}


# If there are values not categorized they will be represented as NA

vallabels_continuous = function(data) {
data$H0001101[1.0 <= data$H0001101 & data$H0001101 <= 4.0] <- 1.0
data$H0001101[5.0 <= data$H0001101 & data$H0001101 <= 9.0] <- 5.0
data$H0001101[10.0 <= data$H0001101 & data$H0001101 <= 14.0] <- 10.0
data$H0001101[15.0 <= data$H0001101 & data$H0001101 <= 19.0] <- 15.0
data$H0001101[20.0 <= data$H0001101 & data$H0001101 <= 24.0] <- 20.0
data$H0001101 <- factor(data$H0001101,
levels=c(0.0,1.0,5.0,10.0,15.0,20.0),
labels=c("0",
"1 TO 4",
"5 TO 9",
"10 TO 14",
"15 TO 19",
"20 TO 24"))
data$R3896820[1.0 <= data$R3896820 & data$R3896820 <= 4.0] <- 1.0
data$R3896820[5.0 <= data$R3896820 & data$R3896820 <= 9.0] <- 5.0
data$R3896820[10.0 <= data$R3896820 & data$R3896820 <= 14.0] <- 10.0
data$R3896820[15.0 <= data$R3896820 & data$R3896820 <= 19.0] <- 15.0
data$R3896820[20.0 <= data$R3896820 & data$R3896820 <= 24.0] <- 20.0
data$R3896820[25.0 <= data$R3896820 & data$R3896820 <= 29.0] <- 25.0
data$R3896820 <- factor(data$R3896820,
levels=c(0.0,1.0,5.0,10.0,15.0,20.0,25.0),
labels=c("0",
"1 TO 4",
"5 TO 9",
"10 TO 14",
"15 TO 19",
"20 TO 24",
"25 TO 29"))
data$R3914900[1.0 <= data$R3914900 & data$R3914900 <= 4.0] <- 1.0
data$R3914900[5.0 <= data$R3914900 & data$R3914900 <= 9.0] <- 5.0
data$R3914900[10.0 <= data$R3914900 & data$R3914900 <= 14.0] <- 10.0
data$R3914900[15.0 <= data$R3914900 & data$R3914900 <= 19.0] <- 15.0
data$R3914900[20.0 <= data$R3914900 & data$R3914900 <= 24.0] <- 20.0
data$R3914900[25.0 <= data$R3914900 & data$R3914900 <= 29.0] <- 25.0
data$R3914900[30.0 <= data$R3914900 & data$R3914900 <= 34.0] <- 30.0
data$R3914900[35.0 <= data$R3914900 & data$R3914900 <= 39.0] <- 35.0
data$R3914900[40.0 <= data$R3914900 & data$R3914900 <= 44.0] <- 40.0
data$R3914900[45.0 <= data$R3914900 & data$R3914900 <= 49.0] <- 45.0
data$R3914900[50.0 <= data$R3914900 & data$R3914900 <= 9999999.0] <- 50.0
data$R3914900 <- factor(data$R3914900,
levels=c(0.0,1.0,5.0,10.0,15.0,20.0,25.0,30.0,35.0,40.0,45.0,50.0),
labels=c("0",
"1 TO 4",
"5 TO 9",
"10 TO 14",
"15 TO 19",
"20 TO 24",
"25 TO 29",
"30 TO 34",
"35 TO 39",
"40 TO 44",
"45 TO 49",
"50 TO 9999999: 50+"))
data$R4978910[1.0 <= data$R4978910 & data$R4978910 <= 4.0] <- 1.0
data$R4978910[5.0 <= data$R4978910 & data$R4978910 <= 9.0] <- 5.0
data$R4978910[10.0 <= data$R4978910 & data$R4978910 <= 14.0] <- 10.0
data$R4978910[15.0 <= data$R4978910 & data$R4978910 <= 19.0] <- 15.0
data$R4978910[20.0 <= data$R4978910 & data$R4978910 <= 24.0] <- 20.0
data$R4978910[25.0 <= data$R4978910 & data$R4978910 <= 29.0] <- 25.0
data$R4978910 <- factor(data$R4978910,
levels=c(0.0,1.0,5.0,10.0,15.0,20.0,25.0),
labels=c("0",
"1 TO 4",
"5 TO 9",
"10 TO 14",
"15 TO 19",
"20 TO 24",
"25 TO 29"))
data$R4979400[15.0 <= data$R4979400 & data$R4979400 <= 99.0] <- 15.0
data$R4979400 <- factor(data$R4979400,
levels=c(0.0,1.0,2.0,3.0,4.0,5.0,6.0,7.0,8.0,9.0,10.0,11.0,12.0,13.0,14.0,15.0),
labels=c("0",
"1",
"2",
"3",
"4",
"5",
"6",
"7",
"8",
"9",
"10",
"11",
"12",
"13",
"14",
"15 TO 99: 15+"))
data$R4979500[15.0 <= data$R4979500 & data$R4979500 <= 99.0] <- 15.0
data$R4979500 <- factor(data$R4979500,
levels=c(0.0,1.0,2.0,3.0,4.0,5.0,6.0,7.0,8.0,9.0,10.0,11.0,12.0,13.0,14.0,15.0),
labels=c("0",
"1",
"2",
"3",
"4",
"5",
"6",
"7",
"8",
"9",
"10",
"11",
"12",
"13",
"14",
"15 TO 99: 15+"))
data$T4914700[10.0 <= data$T4914700 & data$T4914700 <= 999.0] <- 10.0
data$T4914700 <- factor(data$T4914700,
levels=c(0.0,1.0,2.0,3.0,4.0,5.0,6.0,7.0,8.0,9.0,10.0),
labels=c("0",
"1",
"2",
"3",
"4",
"5",
"6",
"7",
"8",
"9",
"10 TO 999: 10+"))
return(data)
}

varlabels <- c("H40 7-ITEM CES-D SCORE XRND",
"ID# (1-12686) 79",
"SAMPLE ID  79 INT",
"RACL/ETHNIC COHORT /SCRNR 79",
"SEX OF R 79",
"7-ITEM CES-D SCORE 92",
"DRUG # DAYS DRANK ALCOHOL IN LAST MO 92",
"DRUG # DRNKS ON AVG DAY WHEN DRNKS 92",
"7-ITEM CES-D SCORE 94",
"TIMES HAD 6/MORE DRINKS LAST 94",
"HOW MANY OF LAST 30 DAYS DRANK A 94",
"NO. OF DRINKS ON AVG. DAY WHEN R 94",
"# OF DRINKS R HAS ON AVERAGE DAY 2014"
)


# Use qnames rather than rnums

qnames = function(data) {
names(data) <- c("H40-CESD_SCORE_7_ITEM_XRND",
"CASEID_1979",
"SAMPLE_ID_1979",
"SAMPLE_RACE_78SCRN",
"SAMPLE_SEX_1979",
"CESD_SCORE_7_ITEM_1992",
"Q12-5_1992",
"Q12-6_1992",
"CESD_SCORE_7_ITEM_1994",
"Q12-4_1994",
"Q12-5_1994",
"Q12-6_1994",
"Q12-6_2014")
return(data)
}


#********************************************************************************************************

# Remove the '#' before the following line to create a data file called "categories" with value labels.
#categories <- vallabels(new_data)

# Remove the '#' before the following lines to rename variables using Qnames instead of Reference Numbers
#new_data <- qnames(new_data)
#categories <- qnames(categories)

# Produce summaries for the raw (uncategorized) data file
summary(new_data)

# Remove the '#' before the following lines to produce summaries for the "categories" data file.
#categories <- vallabels(new_data)
#categories <- vallabels_continuous(new_data)
#summary(categories)

#************************************************************************************************************

