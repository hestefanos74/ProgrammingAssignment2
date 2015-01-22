## "makeCacheMatrix" is a function that creates a special
## matrix object which can cache its matrix inverse.
## The condition for the function  to run is that the 
## matrix entered be a square invertible matrix.

makeCacheMatrix <- function(x = matrix()){ ## Creating the 
  ## function with argument 'x' as an empty matrix.
  matinv <- matrix() ## Assign initial vector for the matrix
  ## matinv as empty matrix with allocated memory space.
  set <- function(y = matrix()) {## a function to make the calling 
    ##  of the vector varible applied from the parent environment
    ## i.e the glopal environment (cached memory).
    ## Also it used to change the cached matrix.
    x <<- y  ## Assigning the argument x to the calling environment
    matinv <<- matrix() ## Re-initialize the initial vector of
    ## the cached matrix.
  }
  get <- function() x 
}



cacheSolve <- function(x,...){
  ## Return a matrix that is the inverse of 'x'
}