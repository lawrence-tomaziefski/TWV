#### Working Directory = "setwd('/Users/lawrence_tomaziefski/R_Working_Directory/161120_TWV_IRR')"
setwd('/Users/lawrence_tomaziefski/R_Working_Directory/161120_TWV_IRR')
path = "/Users/lawrence_tomaziefski/R_Working_Directory/161120_TWV_IRR/"
require(ggplot2)
require(dplyr)

#####
##### Start of data processing section. We need our data in certain formats for use in the R functions
#####
#first we read in the .csv file. It has been manually converted from a .xlsx to .csv
# This will read in our data into a data frame
# It will take the first row and make it column names for the data frame
# You need to make sure that any legends or notes on the .csv worksheet are deleted  
results_full = read.csv(paste(path, "FP_M_Preference.csv", sep = ""), header = T, stringsAsFactors = F)
##Get rid of some of the data we don't need
results = select(results_full, -(1:2), -(5:6))
results = mutate(results, OnRoad = OnRoad/100)
qplot(Mobility, data = results, geom = "density", color = Grouped.Unit.Type, facets = .~Grouped.Unit.Type)

m <- ggplot(results,aes(Mobility,OnRoad))
m+geom_point()
m+geom_point() +geom_smooth()
m+geom_point() +geom_smooth(method = "lm")
m+geom_point() +geom_smooth(method = "lm") +facet_grid(Vignette~Grouped.Unit.Type)

p <- ggplot(results,aes(Force.Protection,OnRoad))
p+geom_point()
p+geom_point()+geom_smooth()
p+geom_point() +geom_smooth(method = "lm")
p+geom_point()+geom_smooth(method = "lm") +facet_grid(Vignette~Grouped.Unit.Type)+ coord_cartesian(ylim = c(0,1))
pl = p+geom_point() +geom_smooth() +facet_grid(Vignette.~Grouped.Unit.Type)

