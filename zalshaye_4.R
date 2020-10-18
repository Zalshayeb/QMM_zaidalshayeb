library(lpSolveAPI)
x <- read.lp("C:/Users/Z/Desktop/Quantitaive Managment Modeling/PT_Transportation.lp")
x

solve(x)
get.objective(x)
get.variables(x)
get.constraints(x)
get.sensitivity.objex(x)
get.sensitivity.rhs(x)

library(lpSolveAPI)
y <- read.lp("C:/Users/Z/Desktop/Quantitaive Managment Modeling/NorthAirplane.lp")
y

solve(y)
get.objective(y)
get.variables(y)

