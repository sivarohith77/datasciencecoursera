

CacheMatrix <- function(x = matrix()) {
  
  i<-NULL

  set<-function(y)
  {
    x<<-y
    i<<-NULL
  }

  get<-function()x

  setinverse<-function(inverse)i<<-inverse

  getinverse<-function(inverse)i
  
  list(set=set,get=get,setinverse=setinverse,getinverse=getinerse)
  
}

cache <- function(x, ...)
  {
i<-x$getinverse()

if(!is.null(i)){
 
   message("cached data")
  
  return(i)
}

data<-x$get()

i<-solve(data,...)

x$setinverse(i)

i                
}


