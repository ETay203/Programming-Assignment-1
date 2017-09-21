corr<-function(directory, threshold = 0){
        ##"directory"is a character vector of length 1 indicating
        ## the location of the CSV files
        ## the threshold is a numeric vector of length 1 indicating the
        ## number of completely observed observations (on all variables)
        ## required to compute the correlation between nitrate and sulfate; the default is 0
        
        ## Return a numeric vector of correlations
        
        
        filenames<- list.files(directory, pattern = "*.csv", full.names = TRUE)
        all_files<-length(filenames)
        
       
        cor_vector<-integer()
        ##correlation<-integer()
        
        for(i in 1:all_files){
                
                data<-read.csv(filenames[i])
                count<-0
                for(r in seq_len(nrow(data))){
                        
                        if(!is.na(data[r,"sulfate"]) & !is.na(data[r,"nitrate"])){
                                ##print(c(data[r,"sulfate"], data[r, "nitrate"]))
                                count<-count + 1
                        }else{}
                }
                
                ##print(count)
                ##num_complete<-c(num_complete, count)
                if(count > threshold){
                        ##print("True")
                        correlation<-cor(data[,"sulfate"], data[,"nitrate"], use = "complete.obs")
                        
                        cor_vector<-c(cor_vector, correlation)
                }else{
                        
                }
        }
        return(cor_vector)
}