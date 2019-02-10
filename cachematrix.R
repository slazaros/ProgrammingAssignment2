## makeCacheMatrix is a function with a matrix as input, creating a list of function regarding matrix inversion

## makeCacheMatrix is a function that returns a list of 4 functions
## moreover, it caches in its environment 2 more variables, namely x & m
## x is a matrix
## m is either the inverse matrix of x (if already computed once) or NULL
## set, get, setinverse & getinverse are functions to do the very specific action as explained by its name

## Write a short comment describing this function

makeCacheMatrix <- function(x = matrix()) {
  m <- NULL
  set <- function(y) {
    x <<- y
    m <<- NULL
  }
  get <- function() x
  setinverse <- function(inverse) m <<- inverse
  getinverse <- function() m
  list(set = set, get = get, setinverse = setinverse, getinverse = getinverse)
}


## Write a short comment describing this function

cacheSolve <- function(x, ...) {
  m <- x$getinverse()
  if (!is.null(m)) {
    message("getting cached data")
    return(m)
  }
  data <- x$get()
  m <- solve(data)
  x$setinverse(m)
  m
}
