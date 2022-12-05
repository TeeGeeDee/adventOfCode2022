function day04(file)
    part1,part2 = 0,0
    for line in eachline(file)
        (l1,u1,l2,u2) = parse.(Int,split(line,r"[^0-9]"));
        r1 = l1:u1;
        r2 = l2:u2;
        i = intersect(r1,r2);
        part1 += i==r1 || i==r2;
        part2 += ~isempty(i);
    end
    return part1,part2
end
