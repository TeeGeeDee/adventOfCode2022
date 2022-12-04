function day04(file)
    return Tuple(sum(isoverlap(lineranges(line)...) for line in eachline(file)))
end

function lineranges(line)
    (l1,u1,l2,u2) = parse.(Int,split(line,r"[^0-9]"));
    return (l1:u1,l2:u2)
end

function isoverlap(r1::UnitRange,r2::UnitRange)::Vector{Bool}
    i = intersect(r1,r2);
    return [in(i,[r1,r2]),~isempty(i)];
end
