## The two fucntions, makehacheMatrix and cacheSolve, together find in the inverse of an invertible
## square matrix. Internally, the solve() function is used to find the inverse. These functions 
## provide a wrapper to solve(), in order to introduce caching, since matrix inversion is a costly operation

## This function creates a special matrix object which can cache its inverse.

makeCacheMatrix <- function(x = matrix()) {
    inv <- NULL
    set <- function(y) {
        x <<- y
        inv <<- NULL
    }
    get <- function() x
    setinv <- function(i) inv <<- i
    getinv <- function() inv
    list(set = set, get = get, setinv = setinv, getinv = getinv)
    
}


## This function computes the matrix inverse and saves it to cache, if not already saved in the cache.

cacheSolve <- function(x, ...) {
    ## Return a matrix that is the inverse of 'x'
    
    inv <- x$getinv()
    if(!is.null(inv)) {
        message("getting cached data")
        return(m)
    }
    data <- x$get()
    inv <- solve(data,...)
    x$setinv(inv)
    inv
}
