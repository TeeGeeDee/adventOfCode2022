using Test
include("day02.jl")

const TEST_INPUT = "A Y
B X
C Z"

@test day02(IOBuffer(TEST_INPUT)) == (15,12)