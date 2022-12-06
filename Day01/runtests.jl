using Test
include("day01.jl")

const TEST_INPUT = "1000
2000
3000

4000

5000
6000

7000
8000
9000

10000"

@test day01(IOBuffer(TEST_INPUT))==(24000,45000)