
new_data <- read.table('data/bgadep/good.dat', sep=' ')
names(new_data) <- c('R0000100',
                     'R0000500',
                     'R0173600',
                     'R0214700',
                     'R0214800',
                     'R1021800',
                     'R1022000',
                     'R1022100',
                     'R3896810',
                     'T3044200',
                     'T3044300',
                     'T5616100',
                     'T5616200')


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
  data$R1021800[0.0 <= data$R1021800 & data$R1021800 <= 9.0] <- 0.0
  data$R1021800[26.0 <= data$R1021800 & data$R1021800 <= 99999.0] <- 26.0
  data$R1021800 <- factor(data$R1021800, 
                          levels=c(0.0,10.0,11.0,12.0,13.0,14.0,15.0,16.0,17.0,18.0,19.0,20.0,21.0,22.0,23.0,24.0,25.0,26.0), 
                          labels=c("0 TO 9: < 10",
                                   "10",
                                   "11",
                                   "12",
                                   "13",
                                   "14",
                                   "15",
                                   "16",
                                   "17",
                                   "18",
                                   "19",
                                   "20",
                                   "21",
                                   "22",
                                   "23",
                                   "24",
                                   "25",
                                   "26 TO 99999: 26+"))
  data$R1022000 <- factor(data$R1022000, 
                          levels=c(0.0,1.0,2.0,3.0,4.0,5.0,6.0), 
                          labels=c("NEVER",
                                   "ONCE",
                                   "2 OR 3 TIMES",
                                   "4 OR 5 TIMES",
                                   "6 OR 7 TIMES",
                                   "8 OR 9 TIMES",
                                   "10 OR MORE TIMES"))
  data$R1022100[16.0 <= data$R1022100 & data$R1022100 <= 99999.0] <- 16.0
  data$R1022100 <- factor(data$R1022100, 
                          levels=c(0.0,1.0,2.0,3.0,4.0,5.0,6.0,7.0,8.0,9.0,10.0,11.0,12.0,13.0,14.0,15.0,16.0), 
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
                                   "15",
                                   "16 TO 99999: 16+"))
  data$R3896810[1.0 <= data$R3896810 & data$R3896810 <= 9.0] <- 1.0
  data$R3896810[10.0 <= data$R3896810 & data$R3896810 <= 19.0] <- 10.0
  data$R3896810[20.0 <= data$R3896810 & data$R3896810 <= 29.0] <- 20.0
  data$R3896810[30.0 <= data$R3896810 & data$R3896810 <= 39.0] <- 30.0
  data$R3896810[40.0 <= data$R3896810 & data$R3896810 <= 49.0] <- 40.0
  data$R3896810[50.0 <= data$R3896810 & data$R3896810 <= 59.0] <- 50.0
  data$R3896810[60.0 <= data$R3896810 & data$R3896810 <= 69.0] <- 60.0
  data$R3896810 <- factor(data$R3896810, 
                          levels=c(0.0,1.0,10.0,20.0,30.0,40.0,50.0,60.0), 
                          labels=c("0",
                                   "1 TO 9",
                                   "10 TO 19",
                                   "20 TO 29",
                                   "30 TO 39",
                                   "40 TO 49",
                                   "50 TO 59",
                                   "60 TO 69"))
  data$T3044200[10.0 <= data$T3044200 & data$T3044200 <= 999.0] <- 10.0
  data$T3044200 <- factor(data$T3044200, 
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
  data$T3044300 <- factor(data$T3044300, 
                          levels=c(0.0,1.0,2.0,3.0,4.0,5.0), 
                          labels=c("Never in the last 30 days",
                                   "Less often than once a week",
                                   "1 or 2 times per week",
                                   "3 or 4 times per week",
                                   "5 or 6 times per week",
                                   "Everyday"))
  # data$T5616100 <- factor(data$T5616100, 
  #   levels=c(0.0,1.0), 
  #   labels=c("No",
  #     "Yes"))
  # data$T5616200 <- factor(data$T5616200, 
  #   levels=c(0.0,1.0), 
  #   labels=c("No",
  #     "Yes"))
  return(data)
}

varlabels <- c("ID# (1-12686) 79",
               "DATE OF BIRTH - YR 79",
               "SAMPLE ID  79 INT",
               "RACL/ETHNIC COHORT /SCRNR 79",
               "SEX OF R 79",
               "ALCHL-AGE START DRNK 1 TIME WK 83",
               "ALCHL-FREQ 6/> DRNK @ 1 TM LAST MO 83",
               "ALCHL-#DAYS DRANK ALCOHOL LAST MO 83",
               "20-ITEM CES-D SCORE 92",
               "# OF DRINKS R HAS ON AVERAGE DAY 2010",
               "FREQ OF 6 OR MORE DRINKS AT ONCE IN LAST 30 DAYS 2010",
               "LIVE W ONE DEPRESSED MENTALLY ILL SUICIDAL <18 2016",
               "LIVE W PROBLEM DRINKER OR ALCHOLIC <18 2016"
)

