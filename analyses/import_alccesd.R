
new_data <- read.table('data/alccesd/alccesd.dat', sep=' ')
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


