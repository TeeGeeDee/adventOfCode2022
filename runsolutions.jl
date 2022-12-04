include("Day01/day01.jl");
include("Day02/day02.jl");
include("Day03/day03.jl");



# Compile (what it says to do here: https://docs.julialang.org/en/v1/manual/performance-tips/#Measure-performance-with-[@time](@ref)-and-pay-attention-to-memory-allocation)
open(day01,"Day01/data.txt");
open(day02,"Day02/data.txt");
open(day03,"Day03/data.txt");



println("Day 1:");
@time out = open(day01,"Day01/data.txt");
# 0.000383 seconds (4.64 k allocations: 108.391 KiB)
println("Solutions = $out.");
# Solutions = (69310, 206104).
println("Day 2:");
@time out = open(day02,"Day02/data.txt");
# 0.001984 seconds (17.51 k allocations: 625.812 KiB)
println("Solutions = $out.");
# Solutions = (9759, 12429).
println("Day 3:");
@time out = open(day03,"Day03/data.txt");
# 0.001692 seconds (10.59 k allocations: 958.578 KiB)
println("Solutions = $out.");
# Solutions = (8085, 2515).
