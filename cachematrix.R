makeCacheMatrix <- function(x = matrix()) {
j <- NULL
        set <- function(y) {
                x <<- y
                j <<- NULL
        }
        get <- function() x
        setiverse <- function(inverse) j <<- inverse
        getinverse <- function() j
        list(set = set, get = get,
             setinverse = setinverse,
             getinverse = getinverse)
}


## The first function, makeCacheMatrix creates a matrix, which is really a list containing a function to set and get the value of the matrix and of the inverse function.

cacheSolve <- function(x, ...) {
         j <- x$getinverse()
        if(!is.null(j)) {
                message("getting cached data")
                return(j)
        }
        data <- x$get()
        j <- inverse(data, ...)
        x$setinverse(j)
        j
}
        ## Return a matrix that is the inverse of 'x'
}
