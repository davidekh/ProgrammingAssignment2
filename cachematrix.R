## Put comments here that give an overall description of what your
## functions do

## makeCacheMAtrix provides the set of methods to set, get and setsolve and getsolve for matrix
## set - sets the matrix content
## get - gets the matrix content
## setsolve - sets the solve(x) - inversion of the matrix
## getsolve - gets the solved inverted matrix if is cached otherwise returns NULL

makeCacheMatrix <- function(x = matrix()) {
        s <- NULL
        set <- function(y) {
                x <<- y
                s <<- NULL
        }
        get <- function() x
        setsolve <- function(solve) s <<- solve
        getsolve <- function() s
        list(set = set, get = get,
             setsolve = setsolve,
             getsolve = getsolve)
}


## Write a short comment describing this function

cacheSolve <- function(x, ...) {
        ## Return a matrix that is the inverse of 'x'
}
