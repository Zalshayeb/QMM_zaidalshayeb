library(lpSolveAPI)

lprec <- make.lp(0, 9)

set.objfn(lprec, c(420, 360, 300, 420, 360, 300, 420, 360, 300))

lp.control(lprec,sense='max')

add.constraint(lprec, c(1, 1, 1, 0, 0, 0, 0, 0, 0), "<=", 750)
add.constraint(lprec, c(0, 0, 0, 1, 1, 1, 0, 0, 0), "<=", 900)
add.constraint(lprec, c(0, 0, 0, 0, 0, 0, 1, 1, 1), "<=", 450)
add.constraint(lprec, c(20, 15, 12, 0, 0, 0, 0, 0, 0), "<=", 13000)
add.constraint(lprec, c(0, 0, 0, 20, 15, 12, 0, 0, 0), "<=", 12000)
add.constraint(lprec, c(0, 0, 0, 0, 0, 0, 20, 15, 12), "<=", 5000)
add.constraint(lprec, c(1, 0, 0, 1, 0, 0, 1, 0, 0), "<=", 900)
add.constraint(lprec, c(0, 1, 0, 0, 1, 0, 0, 1, 0), "<=", 1200)
add.constraint(lprec, c(0, 0, 1, 0, 0, 1, 0, 0, 1), "<=", 750)
add.constraint(lprec, c(900, 900, 900, -750, -750, -750, 0, 0, 0), "=", 0)
add.constraint(lprec, c(900, 900, 900, 0, 0, 0, -750, -750, -750), "=", 0)

RowNames <- c("Plant 1 Large", "Plant 1 Medium", "Plant 1 Small", "Plant 2 Large", "Plant 2 Medium"
             , "Plant 2 Small", "Plant 3 Large", "Plant 3 Medium", "Plant 3 Small", "Eleven", "Twelve")
ColNames <- c("Large 1", "Medium 1", "Small 1", "Large 2", "Medium 2", "Small 2", "Large 3"
            , "Medium 3", "Small 3")
dimnames(lprec) <- list(RowNames, ColNames)

lprec

write.lp(lprec, filename = "wgc.lp", type = "lp")

solve(lprec)

get.objective(lprec)
get.variables(lprec)

x <- read.lp("C:/Users/Z/Desktop/Quantitaive Managment Modeling/wgc.lp") # create an lp object x
x                          # display x

solve(x)
get.objective(x)        # get objective value
get.variables(x)        # get values of decision variables
get.constraints(x)      # get constraint RHS values

