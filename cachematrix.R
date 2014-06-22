## Here are two functions to allow cache the inversion of matrix and return it if needed
## First function makeCacheMatrix is utility function keeping the value of original matrix as well as the cached inversion matrix
## Second function cacheSolve actually returns the inversion matrix from matrix stored in makeCacheMatrix

## makeCacheMtrix provides the set of methods to set, get and setsolve and getsolve for matrix
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


## cacheSolve returns the inversion matrix of matrix stored in makeCacheMatrix
##   it either returns value chached previously
##   or it calculates the inversion matrix using function solve(Matrix) and then stores inverted matrix for further use 

cacheSolve <- function(x, ...) {
        ## Return a matrix that is the inverse of 'x'
        s <- x$getsolve() ## get the cached value (or NULL if not solved and stored yet)
        if(!is.null(s)) {
                message("getting cached data") ## just information that stored version is being used
                return(s) ## returning of inversion matrix already stored in makeCacheMatrix
        }
        data <- x$get()   ## get the content of matrix stored in makeCacheMatrix to variable data
        s <- solve(data)  ## actual calculation of inversion from variable data
        x$setsolve(s)     ## setting the chached value using makeCacheMatrix setsolve 
        s                 ## returnig of newly created inversion matrix
}
