\name{pluripotents.frame}
\alias{pluripotents.frame}
\docType{data}
\title{
Manually curated list of pluripotent arrays
}
\description{
A manually compiled list of pluripotent arrays (induced pluripotent cells and 
embryonic stem cells) together with their GEO IDs and descriptions
}
\usage{pluripotents.frame}
\format{
    A data frame with 278 observations on the following 5 variables.
    \describe{
        \item{\code{GSM}}{GEO sample ID}
        \item{\code{GSE}}{GEO series ID}
        \item{\code{GPL}}{GEO platform ID}
        \item{\code{source}}{GEO description - Source}
        \item{\code{Characteristics}}{GEO description - Characteristic}
    }
}
\source{
\url{http://www.ncbi.nlm.nih.gov/geo/}
}
\references{
Altschuler, G. M., O. Hofmann, I. Kalatskaya, R. Payne, S. J. Ho Sui, U. Saxena,
A. V. Krivtsov, S. A. Armstrong, T. Cai, L. Stein and W. A. Hide (2013). 
"Pathprinting: An integrative approach to understand the functional basis of 
disease." Genome Med 5(7): 68.
}
\seealso{
\code{\link{consensusDistance}}, \code{\link{consensusFingerprint}}
}
\examples{
require(pathprintGEOData)
library(SummarizedExperiment)

# load  the data
data(SummarizedExperimentGEO)

ds = c("chipframe", "genesets","pathprint.Hs.gs",
    "platform.thresholds","pluripotents.frame")
data(list = ds)

# extract part of the GEO.fingerprint.matrix and GEO.metadata.matrix
GEO.fingerprint.matrix = assays(geo_sum_data[,300000:350000])$fingerprint
GEO.metadata.matrix = colData(geo_sum_data[,300000:350000])

# Extract common GSMs since we only loaded part of the geo_sum_data object
common_GSMs <- intersect(pluripotents.frame$GSM,colnames(GEO.fingerprint.matrix))

# free up space by removing the geo_sum_data object
remove(geo_sum_data)

head(pluripotents.frame)

# Use pathway fingerprints to search for
# additional pluripotent arrays across GEO
# create consensus pluripotent fingerprint
pluripotent.consensus<-consensusFingerprint(
    GEO.fingerprint.matrix[,common_GSMs], threshold=0.9)

# calculate distance from the pluripotent consensus
geo.pluripotentDistance<-consensusDistance(
    pluripotent.consensus, GEO.fingerprint.matrix)

# plot histograms
par(mfcol = c(2,1), mar = c(0, 4, 4, 2))
geo.pluripotentDistance.hist<-hist(geo.pluripotentDistance[,"distance"],
    nclass = 50, xlim = c(0,1), main = "Distance from pluripotent consensus")
par(mar = c(7, 4, 4, 2))
hist(geo.pluripotentDistance[pluripotents.frame$GSM, "distance"],
        breaks = geo.pluripotentDistance.hist$breaks, xlim = c(0,1), 
    main = "", xlab = "above: all GEO, below: pluripotent samples")
}
\keyword{datasets}
