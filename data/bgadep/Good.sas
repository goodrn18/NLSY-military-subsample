options nocenter validvarname=any;

*---Read in space-delimited ascii file;

data new_data;


infile 'good.dat' lrecl=44 missover DSD DLM=' ' print;
input
  R0000100
  R0000500
  R0173600
  R0214700
  R0214800
  R1021800
  R1022000
  R1022100
  R3896810
  T3044200
  T3044300
  T5616100
  T5616200
;
array nvarlist _numeric_;


*---Recode missing values to SAS custom system missing. See SAS
      documentation for use of MISSING option in procedures, e.g. PROC FREQ;

do over nvarlist;
  if nvarlist = -1 then nvarlist = .R;  /* Refused */
  if nvarlist = -2 then nvarlist = .D;  /* Dont know */
  if nvarlist = -3 then nvarlist = .I;  /* Invalid missing */
  if nvarlist = -4 then nvarlist = .V;  /* Valid missing */
  if nvarlist = -5 then nvarlist = .N;  /* Non-interview */
end;

  label R0000100 = "ID# (1-12686) 79";
  label R0000500 = "DATE OF BIRTH - YR 79";
  label R0173600 = "SAMPLE ID  79 INT";
  label R0214700 = "RACL/ETHNIC COHORT /SCRNR 79";
  label R0214800 = "SEX OF R 79";
  label R1021800 = "ALCHL-AGE START DRNK 1 TIME WK 83";
  label R1022000 = "ALCHL-FREQ 6/> DRNK @ 1 TM LAST MO 83";
  label R1022100 = "ALCHL-#DAYS DRANK ALCOHOL LAST MO 83";
  label R3896810 = "20-ITEM CES-D SCORE 92";
  label T3044200 = "# OF DRINKS R HAS ON AVERAGE DAY 2010";
  label T3044300 = "FREQ OF 6 OR MORE DRINKS AT ONCE IN LAST 30 DAYS 2010";
  label T5616100 = "LIVE W ONE DEPRESSED MENTALLY ILL SUICIDAL <18 2016";
  label T5616200 = "LIVE W PROBLEM DRINKER OR ALCHOLIC <18 2016";

/*---------------------------------------------------------------------*
 *  Crosswalk for Reference number & Question name                     *
 *---------------------------------------------------------------------*
 * Uncomment and edit this RENAME statement to rename variables
 * for ease of use.  You may need to use  name literal strings
 * e.g.  'variable-name'n   to create valid SAS variable names, or 
 * alter variables similarly named across years.
 * This command does not guarantee uniqueness

 * See SAS documentation for use of name literals and use of the
 * VALIDVARNAME=ANY option.     
 *---------------------------------------------------------------------*/
  /* *start* */

* RENAME
  R0000100 = 'CASEID_1979'n
  R0000500 = 'Q1-3_A~Y_1979'n
  R0173600 = 'SAMPLE_ID_1979'n
  R0214700 = 'SAMPLE_RACE_78SCRN'n
  R0214800 = 'SAMPLE_SEX_1979'n
  R1021800 = 'ALCH-2A_1983'n
  R1022000 = 'Q12-4_1983'n
  R1022100 = 'Q12-5_1983'n
  R3896810 = 'CESD_SCORE_20_ITEM_1992'n
  T3044200 = 'Q12-6_2010'n
  T3044300 = 'Q12-4_2010'n
  T5616100 = 'Q11-RCH-HLTH-4_2016'n
  T5616200 = 'Q11-RCH-HLTH-5_2016'n
;
  /* *finish* */

run;

proc means data=new_data n mean min max;
run;


/*---------------------------------------------------------------------*
 *  FORMATTED TABULATIONS                                              *
 *---------------------------------------------------------------------*
 * You can uncomment and edit the PROC FORMAT and PROC FREQ statements 
 * provided below to obtain formatted tabulations. The tabulations 
 * should reflect codebook values.
 * 
 * Please edit the formats below reflect any renaming of the variables
 * you may have done in the first data step. 
 *---------------------------------------------------------------------*/

/*
proc format; 
value vx1f
  0-56='0 TO 56: < 57'
  57='57'
  58='58'
  59='59'
  60='60'
  61='61'
  62='62'
  63='63'
  64='64'
  65='65'
  66='66'
  67='67'
  68='68'
  69='69'
  70='70'
  71='71'
  72='72'
  73-99999='73 TO 99999: 73+'
;
value vx2f
  1='CROSS MALE WHITE'
  2='CROSS MALE WH. POOR'
  3='CROSS MALE BLACK'
  4='CROSS MALE HISPANIC'
  5='CROSS FEMALE WHITE'
  6='CROSS FEMALE WH POOR'
  7='CROSS FEMALE BLACK'
  8='CROSS FEMALE HISPANIC'
  9='SUP MALE WH POOR'
  10='SUP MALE BLACK'
  11='SUP MALE HISPANIC'
  12='SUP FEM WH POOR'
  13='SUP FEMALE BLACK'
  14='SUP FEMALE HISPANIC'
  15='MIL MALE WHITE'
  16='MIL MALE BLACK'
  17='MIL MALE HISPANIC'
  18='MIL FEMALE WHITE'
  19='MIL FEMALE BLACK'
  20='MIL FEMALE HISPANIC'
;
value vx3f
  1='HISPANIC'
  2='BLACK'
  3='NON-BLACK, NON-HISPANIC'
;
value vx4f
  1='MALE'
  2='FEMALE'
;
value vx5f
  0-9='0 TO 9: < 10'
  10='10'
  11='11'
  12='12'
  13='13'
  14='14'
  15='15'
  16='16'
  17='17'
  18='18'
  19='19'
  20='20'
  21='21'
  22='22'
  23='23'
  24='24'
  25='25'
  26-99999='26 TO 99999: 26+'
;
value vx6f
  0='NEVER'
  1='ONCE'
  2='2 OR 3 TIMES'
  3='4 OR 5 TIMES'
  4='6 OR 7 TIMES'
  5='8 OR 9 TIMES'
  6='10 OR MORE TIMES'
;
value vx7f
  0='0'
  1='1'
  2='2'
  3='3'
  4='4'
  5='5'
  6='6'
  7='7'
  8='8'
  9='9'
  10='10'
  11='11'
  12='12'
  13='13'
  14='14'
  15='15'
  16-99999='16 TO 99999: 16+'
;
value vx8f
  0='0'
  1-9='1 TO 9'
  10-19='10 TO 19'
  20-29='20 TO 29'
  30-39='30 TO 39'
  40-49='40 TO 49'
  50-59='50 TO 59'
  60-69='60 TO 69'
;
value vx9f
  0='0'
  1='1'
  2='2'
  3='3'
  4='4'
  5='5'
  6='6'
  7='7'
  8='8'
  9='9'
  10-999='10 TO 999: 10+'
;
value vx10f
  0='Never in the last 30 days'
  1='Less often than once a week'
  2='1 or 2 times per week'
  3='3 or 4 times per week'
  4='5 or 6 times per week'
  5='Everyday'
;
value vx11f
  0='No'
  1='Yes'
;
value vx12f
  0='No'
  1='Yes'
;
*/

/* 
 *--- Tabulations using reference number variables;
proc freq data=new_data;
tables _ALL_ /MISSING;
  format R0000500 vx1f.;
  format R0173600 vx2f.;
  format R0214700 vx3f.;
  format R0214800 vx4f.;
  format R1021800 vx5f.;
  format R1022000 vx6f.;
  format R1022100 vx7f.;
  format R3896810 vx8f.;
  format T3044200 vx9f.;
  format T3044300 vx10f.;
  format T5616100 vx11f.;
  format T5616200 vx12f.;
run;
*/

/*
*--- Tabulations using default named variables;
proc freq data=new_data;
tables _ALL_ /MISSING;
  format 'Q1-3_A~Y_1979'n vx1f.;
  format 'SAMPLE_ID_1979'n vx2f.;
  format 'SAMPLE_RACE_78SCRN'n vx3f.;
  format 'SAMPLE_SEX_1979'n vx4f.;
  format 'ALCH-2A_1983'n vx5f.;
  format 'Q12-4_1983'n vx6f.;
  format 'Q12-5_1983'n vx7f.;
  format 'CESD_SCORE_20_ITEM_1992'n vx8f.;
  format 'Q12-6_2010'n vx9f.;
  format 'Q12-4_2010'n vx10f.;
  format 'Q11-RCH-HLTH-4_2016'n vx11f.;
  format 'Q11-RCH-HLTH-5_2016'n vx12f.;
run;
*/