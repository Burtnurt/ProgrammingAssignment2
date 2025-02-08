## Put comments here that give an overall description of what your
## functions do

## Write a short comment describing this function
## This function creates a special matrix object that can cache its inverse.
makeCacheMatrix <- function(x = matrix()) {
  inv <- NULL
  set <- function(y) {
    x <<- y
    inv <<- NULL
  }
  get <- function() x
  setInverse <- function(inverse) inv <<- inverse
  getInverse <- function() inv
  list(set = set, get = get,
       setInverse = setInverse,
       getInverse = getInverse)
}



## Write a short comment describing this function
## this function computes the inverse of the special matrix returned by makeCacheMatrix
cacheSolve <- function(x, ...) {
  inv <- x$getInverse()
  if (!is.null(inv)) {
    message("getting cached data")
    return(inv)
  }
  data <- x$get()
  inv <- solve(data, ...)
  x$setInverse(inv)
  inv
}


specialMat <- makeCacheMatrix(mat)
> 
  > inv1 <- cacheSolve(specialMat)
> print(inv1)
[,1] [,2]
[1,]   -2  1.5
[2,]    1 -0.5
> inv2 <- cacheSolve(specialMat)
getting cached data
> print(inv2)
[,1] [,2]
[1,]   -2  1.5
[2,]    1 -0.5
