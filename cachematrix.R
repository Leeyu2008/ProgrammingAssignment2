## the below pair of functions are to create a special matrix and to cache the inverse of the matrix.

## This function creates a special "matrix" object that can cache its inverse
##The first function, makeCacheMatrix is to create a invertible matrix, which returns a list containing a function to
##              1. set the matrix
##              2. get the matrix
##              3. set the inverse of the matrix
##              4. get the inverse of the matrix
makeCacheMatrix <- function(x = matrix()) {
   invm<-NULL
   set<-function(y){
     x<<-y
     invm<<-NULL
   }
   get<-function()x
   setinvmt<-function(solve)invm<<-solve
   getinvmt<-function()invm
   list(set<-set,get<-get, setinvmt<-setinvmt, getinvmt<-getinvmt)
}


## This function computes the inverse of the special "matrix" returned by makeCacheMatrix above.

cacheSolve <- function(x, ...) {
  invm<-x$getinvmt()
  if(!is.null(invm)){
    message("getting cached data") 
    return(invm)
  }
  data<-x$get()
  invm<-solve(data,...)
  x$setinvmt(invm)
  invm
        
}

