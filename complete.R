complete<-function(directory, id = 1:332){
        ##"directory"is a character vector of length 1 indicating
        ## the location of the CSV files
        ##"id"is an integer vector indicating the monitor ID numbers to be used
        
        ##Return a data frame of the form:
        ##id  nobs
        ##1   117
        ##2   1041
        ##...
        ##where 'id'is the monitor ID number and "nobs" is the 
        ##number of complete cases
        
        
        filenames<- list.files(directory, pattern = "*.csv", full.names = TRUE)
        all_files<-length(filenames)
        subset_files<-filenames[id]
        ##print(subset_files)
        ##print(id)
        id_vector<-integer()
        num_complete<-integer()
        
        for(i in id){
                subset_files<-filenames[i]

                data<-read.csv(filenames[i])
                count<-0
                for(r in seq_len(nrow(data))){
                        
                        if(!is.na(data[r,"sulfate"]) & !is.na(data[r,"nitrate"])){
                                ##print(c(data[r,"sulfate"], data[r, "nitrate"]))
                                count<-count + 1
                        }else{}
                }
                
                ##print(count)
                num_complete<-c(num_complete, count)
                id_vector<-c(id_vector, i)
        }
        
        output<-data.frame(id = id_vector, nobs = num_complete)
        print(output)
}
                
      
        
        
       
        
