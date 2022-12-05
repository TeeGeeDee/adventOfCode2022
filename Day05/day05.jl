function day05(file)
    inputstream = Iterators.takewhile(!isempty,eachline(file));
    display = reduce(vcat,permutedims(collect((line))) for line in inputstream);
    crates = [[c for c in Iterators.takewhile(!=(' '),display[end-1:-1:1,i])] for i in findall(display[end,:].!=' ')];
    crates2 = deepcopy(crates);
    for line in inputstream
        n,from,to = parse.(Int,filter(!isempty,split(line,r"[^0-9]+")));
        staging = [];
        for _ in 1:n
            push!(crates[to],pop!(crates[from]));
            push!(staging,pop!(crates2[from]));
        end
        for _ in 1:n
            push!(crates2[to],pop!(staging));
        end
    end
    return String([pop!(crate) for crate in crates]),String([pop!(crate) for crate in crates2])
end