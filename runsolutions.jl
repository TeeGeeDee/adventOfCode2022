include("Day01/day01.jl");

# Compile (what it says to do here: https://docs.julialang.org/en/v1/manual/performance-tips/#Measure-performance-with-[@time](@ref)-and-pay-attention-to-memory-allocation)
open(day01,"Day01/data.txt");

println("Day 1:");
@time out = open(day01,"Day01/data.txt");
# 0.000499 seconds (4.29 k allocations: 175.094 KiB)
println("Solutions = $out.");