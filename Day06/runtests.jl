using Test
include("day06.jl");

TEST_INPUT1 = "mjqjpqmgbljsphdztnvjfqwrcgsmlb"
TEST_INPUT2 = "bvwbjplbgvbhsrlpgdmjqwftvncz"
TEST_INPUT3 = "nppdvjthqldpwncqszvftbrmjlhg"
TEST_INPUT4 = "nznrnfrfntjfmvfwmzdfjlvtqnbhcprsg"
TEST_INPUT5 = "zcfzfwzzqfrljwzlrfnpqdbhtmscgvjw"

@test day06(IOBuffer(TEST_INPUT1)) == (7,19)
@test day06(IOBuffer(TEST_INPUT2)) == (5,23)
@test day06(IOBuffer(TEST_INPUT3)) == (6,23)
@test day06(IOBuffer(TEST_INPUT4)) == (10,29)
@test day06(IOBuffer(TEST_INPUT5)) == (11,26)
