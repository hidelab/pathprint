\name{pathprint.Ce.gs}
\alias{pathprint.Ce.gs}
\docType{data}
\title{
Pathprint genesets - C. elegans
}
\description{
Pathways and genesets used by pathprint for \emph{C. elegans} arrays, referenced
by Entrez Gene ID
}
\usage{pathprint.Ce.gs}
\details{
Gene sets were inferred by homology from the human genesets, 
\code{\link{pathprint.Hs.gs}},
using the HomoloGene database, \url{www.ncbi.nlm.nih.gov/homologene}
}
\source{
O. Hofmann
}

\references{
Sayers et al. Database resources of the National Center for Biotechnology 
Information. Nucleic Acids Research (2011) vol. 39 (Database issue) pp. D38-51
\cr Altschuler, G. M., O. Hofmann, I. Kalatskaya, R. Payne, S. J. Ho Sui, 
U. Saxena, A. V. Krivtsov, S. A. Armstrong, T. Cai, L. Stein 
and W. A. Hide (2013). "Pathprinting: An integrative approach to understand 
the functional basis of disease." Genome Med 5(7): 68.
}
\examples{
data("pathprint.Ce.gs")
pathprint.Ce.gs[grep("ZN175_7728", names(pathprint.Ce.gs))]
}
\keyword{datasets}
