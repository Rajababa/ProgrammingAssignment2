 ## This function computes the inverse of a matrix using the cache method to 
 ## save computation time


 ## Create a special "matrix" object that can cache its inverse

 makeCacheMatrix <- function(x = matrix()) {
 ## The inverse of a matrix stored in cache i
    i <- NULL
    print(environment())
  + evn <- environment()
  + print(parent.env(evn))
  
  ## sets the matrix and uses the "<<- operator" to avoid lexical scoping
 set <- function(y) {
   x <<- y
+  i <<- NULL
  }
  
  ## get a matrix
  get <- function() x		
  
  # sets inverse of a matrix
  setinverse <- function(inverse) i <<- inverse

 # gets the inverse of a matrix
  getinverse <- function() i
  getevn<- function() environment()
  list(set = set, get = get, setinverse = setinverse, getinverse = getinverse, getevn = getevn)
  
}

## Calculate the inverse of a matrix. If the inverse has already been calculated (and the matrix has not changed), 
## then the cachesolve should retrieve the inverse from the cache. 

cacheSolve <- function(x, ...) {
  ## Return a matrix that is the inverse of 'x'
  i <- x$getinverse()
  
  # The if condition checks if inverse is already calculated, 
  # If inverse has been calculated, it retrieves from the cache
  
  if(!is.null(i)) {
    message("getting cached data") 
    return(i)
  }
  
  ## If the inverse is not already in the cache, the inverse is calculated using solve function
  data <- x$get()
  i <- solve(data, ...)
  
  # Cache the new inverse 
  x$setinverse(i)
  
  # Return inverse matrix
  i
}
