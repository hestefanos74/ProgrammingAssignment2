## "makeCacheMatrix" is a function that creates a special
## matrix object which can cache its matrix inverse.
## The condition for the function  to run is that the 
## matrix entered be a square invertible matrix.

makeCacheMatrix <- function(x = matrix()){ ## Creating the 
  ## function with argument 'x' as an empty matrix.
  matinv <- NULL ## Assign initial vector for the matrix
  ## matinv as empty matrix with allocated memory space.
  set <- function(y = matrix()) {## a function to make the calling 
    ##  of the free varible vector 'y applied from the parent environment
    ## i.e the glopal environment (cached memory).
    ## Also it used to change the cached matrix.
    x <<- y  ## Assigning the argument x to the calling environment
    ## and assign the free variable matrix vector to the entered matrix 'x'
    matinv <<- NULL ## Re-initialize the initial vector of
    ## the cached invers matrix.
  }
  get <- function() x  ## Get the victor of the  matrix in the cache
  setmatrix<-function(solve)  matinv <<- solve ## Set the cached matrix
  ## to be the inverse of the matrix and assign it to memory 'matinv'
  getmatrix<-function() matinv ## Get the cached matrix inverse
  list(set=set, get=get,   ## List the current environment of the 
       setmatrix=setmatrix,  ## functions.
       getmatrix=getmatrix)
}




cacheSolve <- function(x, ...){   ## Return a matrix that
  ## is the inverse of 'x'
  matinv <- x$getmatrix() ## Get the inverse matrix from the cache
  if(!is.null(matinv)){ ## Check if the cache  of the inverse matrix exist
    message("getting cached data") ## Print that message if inverse matrix
    ## is already exist in memory
    return(matinv) ## Print the cached inverse matrix.
  }
  matrix <- x$get() ## If the cached inverse matrix is empty
  ## Get the matrix entered.
  matinv <- solve(matrix, ...) ## Calculate the matrix inverse
  ## and assign it to the cache inverse matrix
  x$setmatrix(matinv) ## Set the current matrix to  be the cached one
  matinv ## Print the calculated  inverse matrix (cached from
  ## previous line)
}