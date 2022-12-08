using Test
include("day08.jl");

const TEST_INPUT = "30373
25512
65332
33549
35390"

@test day08(IOBuffer(TEST_INPUT)) == (21,8)