include("Day01/day01.jl");
include("Day02/day02.jl");
include("Day03/day03.jl");
include("Day04/day04.jl");
include("Day05/day05.jl");
include("Day06/day06.jl");
include("Day07/day07.jl");
include("Day08/day08.jl");
include("Day09/day09.jl");
include("Day10/day10.jl");
include("Day11/day11.jl");
include("Day12/day12.jl");
include("Day13/day13.jl");
include("Day14/day14.jl");

# Compile (what it says to do here: https://docs.julialang.org/en/v1/manual/performance-tips/#Measure-performance-with-[@time](@ref)-and-pay-attention-to-memory-allocation)
open(day01,"Day01/data.txt");
open(day02,"Day02/data.txt");
open(day03,"Day03/data.txt");
open(day04,"Day04/data.txt");
open(day05,"Day05/data.txt");
open(day06,"Day06/data.txt");
open(day07,"Day07/data.txt");
open(day08,"Day08/data.txt");
open(day10,"Day10/data.txt");
open(day11,"Day11/data.txt");
open(day12,"Day12/data.txt");
open(day13,"Day13/data.txt");
open(day14,"Day14/data.txt");

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
println("Day 7:");
@time out = open(day07,"Day07/data.txt");
# 0.000499 seconds (5.12 k allocations: 293.828 KiB)
println("Solutions = $out.");
# Solutions = (1581595, 1544176).
println("Day 8:");
@time out = open(day08,"Day08/data.txt");
# 0.002502 seconds (7.17 k allocations: 1.908 MiB)
println("Solutions = $out.");
# Solutions = (1818, 368368).
println("Day 9:");
@time out = open(day09,"Day09/data.txt");
# 0.016592 seconds (424.76 k allocations: 26.340 MiB)
println("Solutions = $out.");
# Solutions = (6470, 2658).
println("Day 10:");
@time part1,part2 = open(day10,"Day10/data.txt");
#   0.011604 seconds (3.02 k allocations: 188.528 KiB, 98.37% compilation time)
println("Solution to part 1 = $part1, solution to part 2:");
println(part2)
# Solution to part 1 = 13440, solution to part 2:
# ###..###..####..##..###...##..####..##..
# #..#.#..#....#.#..#.#..#.#..#....#.#..#.
# #..#.###....#..#....#..#.#..#...#..#..#.
# ###..#..#..#...#.##.###..####..#...####.
# #....#..#.#....#..#.#.#..#..#.#....#..#.
# #....###..####..###.#..#.#..#.####.#..#.
println("Day 11:");
@time out = open(day11,"Day11/data.txt");
# 0.124869 seconds (4.50 M allocations: 68.829 MiB, 11.52% gc time)
println("Solutions = $out.");
# Solutions = (113220, 30599555965).
println("Day 12:");
@time out = open(day12,"Day12/data.txt");
# 0.010202 seconds (177.23 k allocations: 7.614 MiB)
println("Solutions = $out.");
# Solutions = (472, 465).
println("Day 13:");
@time out = open(day13,"Day13/data.txt");
# 0.003802 seconds (22.07 k allocations: 2.763 MiB)
println("Solutions = $out.");
# Solutions = (6070, 20758).
println("Day 14:");
@time out = open(day14,"Day14/data.txt");
# 3.338395 seconds (45.97 M allocations: 1.652 GiB, 5.11% gc time)
println("Solutions = $out.");
# Solutions = (1078, 30157).