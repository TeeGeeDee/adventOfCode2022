using Test
include("day12.jl");

const TEST_INPUT = "Sabqponm
abcryxxl
accszExk
acctuvwj
abdefghi";

@test day12(IOBuffer(TEST_INPUT)) == 31