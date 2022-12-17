using Test
include("day14.jl");

const TEST_INPUT = "498,4 -> 498,6 -> 496,6
503,4 -> 502,4 -> 502,9 -> 494,9"

@test day14(IOBuffer(TEST_INPUT)) == (24,93)