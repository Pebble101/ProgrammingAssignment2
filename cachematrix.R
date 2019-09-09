## 

##Create a set of functions to "store" an initial matrix or its inverted version

makeCacheMatrix <- function(x = matrix()) { #Create a function with "x" as an default matrix argument
        Inverted <- NULL #Create an empty object called "Inverted" used later in the code
        set <- function(y) {
                x <<- y #Apply the value of "y" to arg "x" in the parent environment
                Inverted <<- NULL #Apply a NULL value to "Inverted" in the parent environment, IOT clear any previous value
        }
        get <- function() {
                x #Retrieve "x" from the parent environment
        }
        setInverted <- function(inverse){
                Inverted <<- inverse #Apply mean to "Inverted" in the parent environment
        }
        getInverted <- function(){
                Inverted #Retrieve "Inverted" from the parent environment
        }
        list(   #Create a list of the previous functions    
                set = set,
                get = get,
                setInverted = setInverted,
                getInverted = getInverted)
}


##Create a function to populate or retrieve information from makeCacheMatrix function
cacheSolve <- function(x, ...) {
        Inverted <- x$getInverted() #Retrieve "getInverted" of x, which equal "Inverted"
        if(!is.null(Inverted)){ #Verify if "Inverted" is NULLx$
                message("getting cached data") #Inform the user that a cached value was found and will be retrieve
                return(Inverted) #if "Inverted" != NULL, will retreive cached value
        }
        mdata <- x$get() #Retreive "x" and store it in "mdata"
        Inverted <- solve(mdata, ...) #Inverse "x" stored in "mdata" and store it in"Inverted"
        x$setInverted(Inverted) #Use setInverted() of the previous code on "Inverted" to add computed value
        Inverted #Return the value of "Inverted"
}
