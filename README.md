## Introduction
This assignment tested my ability to write functions that interact with different files of data and to deal with data containing missing values. I was required to write three different functions extracting and processing data from different files contained in a given directory.  The first function 'pollutantmean.R'  calculates means.  The second function 'complete.R' determines the number of complete cases, i.e. where the data in each file is complete and has no missing values.  The third function 'corr.R' calculates a correlation between different data based on a threshold value of complete cases.  

## Data
The data for this assignment is given in the directory "specdata".  specdata contains 332 comma-separated-value (CSV) files containing pollution monitoring data for fine particulate matter (PM) air pollution at 332 locations in the United States. Each file contains data from a single monitor and the ID number for each monitor is given as the file name. For example, data for monitor 200 is contained in the file “200.csv”. Each file contains three variables:
* Date - the date of the observation in (year-month-day) format, 
* sulfate - the level of sulfate PM in the air on that date (measured in micrograms per cubic meter), and 
* nitrate - the level of nitrate PM in the air on that date (measured in micrograms per cubic meter)

In each file there are many days where either sulfate or nitrate (or both) are missing (coded as NA). This is common with air pollution monitoring data in the United States.

## pollutantmean.R - Calculating means from data across a number of different files
For this assignment I wrote a function named ‘pollutantmean’ that calculates the mean of a pollutant (sulfate or nitrate) across a specified list of monitors. The function ‘pollutantmean’ takes three arguments: ‘directory’, ‘pollutant’, and ‘id’. Given a vector monitor ID numbers, ‘pollutantmean’ reads that monitors’ particulate matter data from the directory specified in the ‘directory’ argument and returns the mean of the pollutant across all of the monitors, ignoring any missing values coded as NA.


## complete.R - Determining the number of complete cases
For the second part of the assignment I wrote a function that reads a directory full of files and reports the number of completely observed cases in each data file. The function 'complete' returns a data frame where the first column is the name of the file and the second column is the number of complete cases.


##  corr.R - Executing a calculation based on a threshold value
For the third and final part of the assignment I wrote a function, 'corr', that takes a directory of data files and a threshold for complete cases and calculates the correlation between sulfate and nitrate for monitor locations where the number of completely observed cases (on all variables) is greater than the threshold. The function returns a vector of correlations for the monitors that meet the threshold requirement. If no monitors meet the threshold requirement, then the function simply returns a numeric vector of length 0.
