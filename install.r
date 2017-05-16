if(!interactive())(file <- commandArgs(T)[1]) else (
  file <- readline("Enter text file of packages: "))
needed.pkgs <- as.character(as.matrix(read.table(file)))
repo <- "http://cran.us.r-project.org"

install.needed <- function(){
  current.pkgs<-as.character(as.data.frame(installed.packages())$Package)
  to_add <- needed.pkgs[which(!needed.pkgs %in% current.pkgs)]
  for (i in 1:length(to_add)) install.packages(to_add[i], repos=repo)
}

if(!interactive())(install.needed()) else cat("Run install.needed() to install\n")
