include("Day01/day01.jl");
include("Day02/day02.jl");
include("Day03/day03.jl");
include("Day04/day04.jl");
include("Day05/day05.jl");
include("Day06/day06.jl");

# Compile (what it says to do here: https://docs.julialang.org/en/v1/manual/performance-tips/#Measure-performance-with-[@time](@ref)-and-pay-attention-to-memory-allocation)
open(day01,"Day01/data.txt");
open(day02,"Day02/data.txt");
open(day03,"Day03/data.txt");
open(day04,"Day04/data.txt");
open(day05,"Day05/data.txt");
open(day06,"Day06/data.txt");


println("Day 1:");
@time out = open(day01,"Day01/data.txt");
# 0.000380 seconds (4.33 k allocations: 102.984 KiB)
println("Solutions = $out.");
# Solutions = (69310, 206104).
println("Day 2:");
@time out = open(day02,"Day02/data.txt");
# 0.000584 seconds (10.01 k allocations: 508.625 KiB)
println("Solutions = $out.");
# Solutions = (9759, 12429).
println("Day 3:");
@time out = open(day03,"Day03/data.txt");
# 0.001242 seconds (11.29 k allocations: 963.625 KiB)
println("Solutions = $out.");
# Solutions = (8085, 2515).
println("Day 4:");
@time out = open(day04,"Day04/data.txt");
# 0.001109 seconds (4.01 k allocations: 391.484 KiB)
println("Solutions = $out.");
# Solutions = (431, 823).
println("Day 5:");
@time out = open(day05,"Day05/data.txt");
# 0.000918 seconds (3.77 k allocations: 322.734 KiB)
println("Solutions = $out.");
# Solutions = ("GRTSWNJHH", "QLFQDBBHM").
println("Day 6:");
@time out = open(day06,"Day06/data.txt");
# 0.000388 seconds (294 allocations: 74.672 KiB)
println("Solutions = $out.");
# Solutions = (1647, 2447).