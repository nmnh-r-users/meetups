#General set up and close

#advantage of foreach is that it requires slightly less set up
#advantage of parApply functions is that the syntax is basically the same as the serial apply functions


#To use foreach and doParallel libraries
library(doParallel)

numCores <- detectCores()

#don't use all your cores on your own machine
#if you're putting it on hydra its best to specify the exact number or cores that you requested in the job file
cl <- makeCluster(numCores - 1) 
registerDoParallel(cl)

#run analyses

stopCluster()

# or

registerDoParallel(numCores - 1)
#run analyses
stopImplicitCluster()



#to use apply functions with the parallel library

library(parallel)

cl <- makeCluster(numCores - 1)

numCores <- detectCores()

#for allowing variables to be used by all cores in the cluster when using parapply functions
# var <- any variables that you want the cluster to be able to access to run the analyses
clusterExport(cl, "var")

#and any packages you want it to be able to use

clusterEvalQ(cl,library(paleotree))

#run analyses using parLapply or parSapply etc.

stopCluster(cl)