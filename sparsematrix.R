library(tm)
library(Matrix)
library(tidyverse)
library(tidytext)

absalom <- as.data.frame(read_file("absalom_cleaned_to_match_4_30_rev4.txt"))
colnames(absalom) <- "text" 
absalom_df <- absalom %>% 
              unnest_sentences(text, text, strip_punct = TRUE)

x <- TermDocumentMatrix( Corpus( VectorSource( absalom_df ) ) )
y <- sparseMatrix( i=x$i, j=x$j, x=x$v, dimnames = dimnames(x) )  
plot( hclust(dist(t(y))) )
