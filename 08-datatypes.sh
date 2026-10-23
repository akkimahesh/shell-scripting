#!/bin/bash
#in shellscripting only two datatypes numbers and strings
SEPSALARY=1000
OCTSALARY=1100
TOTAL=$(($SEPSALARY + $OCTSALARY)) #(())is only for arthematic operations
echo "My Two months Salary is :: $TOTAL"

SURNAME=Akki
NAME=Mahesh
FULLNAME="${SURNAME} ${NAME}" #To Combine String use {}
echo "My FullName is :: $FULLNAME"

#array
