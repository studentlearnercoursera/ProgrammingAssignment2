## Caching the inverse of a matrix rather than compute it repeatedly saves costs.
## Below are pair of functions that stores and caches the inverse of a matrix..

## This creates an object, matrix, that can cache its inverse.

makeCacheMatrix <- function(P = matrix()) {
     inv <- NULL
     set <- function(A) {
         P <<- A
         inv <<- NULL
     }
     get <- function() P
     setInverse <- function(inverse) inv <<- inverse
     getInverse <- function() inv
     list(set = set,
          get = get,
          setInverse = setInverse,
          getInverse = getInverse)
 }
 


##This computes the inverse of the "matrix" created by makeCacheMatrix above.
 cachemean <- function(P, ...) {
        A <- P$getmean()
        if(!is.null(A)) {
                message("getting cached data")
                return(A)
        }
        data <- P$get()
        A <- mean(data, ...)
        P$setmean(A)
        A
}
