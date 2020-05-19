
CacheMatrix <- function(x = matrix()) {
  
  j<-NULL

  set<-function(y)
  {
    x<<-y
    j<<-NULL
  }

  get<-function()x

  setinverse<-function(inverse)j<<-inverse

  getinverse<-function(inverse)j
  
  list(set=set,get=get,setinverse=setinverse,getinverse=getinverse)
  
}

cache <- function(x, ...)
  {
j<-x$getinverse()

if(!is.null(j)){
 
   message("cached data")
  
  return(j)
}

data<-x$get()

j<-solve(data,...)

x$setinverse(j)

j   
}


