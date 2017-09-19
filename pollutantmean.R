pollutantmean<-function(directory, pollutant, id= 1:332){
##"directory"is a character vector of length 1 indicating
## the location of the CSV files
        
##"pollutant"is a character vectore of length 1 indicating
## the name of the pollutant for which we will calculate the
## mean; either "sulfate"or "nitrate".
        
##"id"is an integer vector indicating the monitor ID numbers to be used

        
        filenames<- list.files(directory, pattern = "*.csv", full.names = TRUE)
        subset_files<-filenames[id]
        ##all_files<-length(filenames)
        ##print(all_files)
        total_sum<-0
        total_values<-0
        
        for(i in id){
                
                subset_files<-filenames[i]
                ##print(filenames[i])
                ##read in data for each file
                data<-read.csv(filenames[i])
                        
                ##calculate the sum of pollutant column  
                        
                sum_file<-sum(data[,pollutant], na.rm = TRUE)
                ##print(sum_file)
                ##add to previous values to create a total sum
                total_sum<-total_sum + sum_file
                        
                ## calculate the number of values evaluated
                        
                num_of_values<-sum(!is.na(data[,pollutant]))
                total_values<-total_values + num_of_values
                ## calculate the mean
                pollutant_mean<- total_sum / total_values
                        
                }
                
        
        print(pollutant_mean)
}








