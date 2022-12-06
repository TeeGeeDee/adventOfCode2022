using Test
include("day05.jl");

const TEST_INPUT = "    [D]    
[N] [C]    
[Z] [M] [P]
 1   2   3 

move 1 from 2 to 1
move 3 from 1 to 3
move 2 from 2 to 1
move 1 from 1 to 2"

@test day05(IOBuffer(TEST_INPUT)) == ("CMZ","MCD")