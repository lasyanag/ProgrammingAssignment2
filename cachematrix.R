## our pair of functions catche an inverse of a martrix

## this function creates a special "matrix" which then can cache its inverse for the input

makeCacheMatrix <- function(x = matrix()) {
    v <- NULL
    set <- function(y) {
        x <<- y
        v <<- NULL
    }
    get <- function() x
    setinv <- function(inv) v <<- inv
    getinv <- function() v
    list(set = set, get = get,
         setinv = setinv,
         getinv = getinv)
   
}


## this function calculates the inverse of the special "matrix" returned by the function above
## in the case that the inverse had not changed and had the same matrix, the catche reult was reused

cacheSolve <- function(x, ...) {
         v <- x$getinv()
         if(!is.null(v)) {
              message("getting cached data")
              return(v)
         }
         data <- x$get()
         v <- mean(data, ...)
         x$setmean(v)
         v
}
