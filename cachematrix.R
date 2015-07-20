## Put comments here that give an overall description of what your
## functions do

## Write a short comment describing this function

## makeCacheMatrix function creates a list of four utility functions
## 1. setCacheMatrix - Set the value of the matrix and cache
## 2. getCacheMatrix - Returns the cached matrix
## 3. setInverseCache - Receives an inverse matrix and saves in cache
## 4. getInverseCache - Returns the cached inverse matrix

makeCacheMatrix <- function(x = matrix()) {

  m1 <- x
  m2 <- NULL
  setCacheMatrix <- function(y = matrix()) {
    m1 <<- y
    m2 <<- NULL
  }
  

  getCacheMatrix <- function() {
    m1
  }
  
  setInverseCache <- function(inv) {
    m2 <<- inv
  }
  
  getInverseCache <- function() m2
  
  list(setCacheMatrix = setCacheMatrix, getCacheMatrix = getCacheMatrix,
       setInverseCache = setInverseCache, getInverseCache = getInverseCache)  
}


## Write a short comment describing this function

## The cacheSolve function uses the function names as list object to call
## the utility functions listed in the above function.
## The function first checks whether the inverse of the matrix is available.
## Else, it calls the getCacheMatrix function and receives the matrix,
## computes the inverse, sets the inverse into the cache using setInverseCache,
## and finally receives the cached inverse matrix.

cacheSolve <- function(x, ...) {
        ## Return a matrix that is the inverse of 'x'

  
  i <- x$getInverseCache()
    if(is.null(i)) {
      m <- x$getCacheMatrix()
      inv <- solve(m)
      x$setInverseCache(inv)
      i <- x$getInverseCache()
    }
    message("Inverse returned from cache")
    return(i)
}
