# list all visiable variables in workspace
ls()
# list all variables in workspace, even hidden names such as '.hidvar'
ls(all.names=TRUE)

# delete all variables in workspace
rm(list=ls(all.names=T))

# print structured output
cat('hello', 'world')

# basic statistics 
x <- c(0,1,1,2,3,5,8,13,21,34)
y <- log(x+1)
mean(x)
median(x)
sd(x)
var(x)
cor(x,y)
cov(x,y)

# create sequence
1:10
seq(from=1, to=10, step=3)
# create repeated sequence
rep(1, times=10)

# compare two vectors
v  <- c(3, pi, 4)
w  <- c(pi, pi, pi)

v == w
any(v == w)
all(v == w)

# element selection tricks
# Invert sign of index to exclude instead of select
fib <- c(0,1,1,2,3,5,8,13,21,34)
fib[-(1:3)]
fib[fib<3]
fib[fib%%2 == 0]
fib[fib > median(fib)]
fib[fib < quantile(fib, 0.05) || fib > quantile(fib, 0.95)]
# this is odd
lst  <- c(1,8,c(4,7,9))
lst[3]
lst[3][2]

# %
# %% modulo
5%%2
# %/% integer division
98%/%9
# %*% matrix multiplication
# %in% 
8 %in% c(9,8,7)

# cd 
setwd('./')
# pwd
getwd()

# save work space
# save.image() # to .RData

# command history
history(10)
history(Inf) # saved to .Rhistory

# results of last evaluation
.Last.value

# loop up libraries loaded
search()

# load datasets
data(mixture, package='ElemStatlearn')
library()

# batch excute files
#R CMD BATCH --quiet myScript.R results.out
