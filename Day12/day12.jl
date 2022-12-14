using DataStructures

const MOVES = [CartesianIndex(0,1), CartesianIndex(1,0), CartesianIndex(0,-1), CartesianIndex(-1,0)]

height(c::Char) = c=='S' ? 'a' : (c=='E' ? 'z' : c);

candidates(pos::CartesianIndex,grid::Matrix{Char},explored::Set{CartesianIndex}) = [i for i in setdiff([pos+mv for mv in MOVES],explored)
                            if checkbounds(Bool,grid,i) && height(grid[pos])<=height(grid[i])+1];

function day12(file)
    # Work from end to start/a square (helps for part 2)
    grid = permutedims(reduce(hcat,collect.(readlines(file))));
    q = Queue{Tuple{CartesianIndex,Int}}();
    endpos = only(findall(grid.=='E'));
    explored = Set{CartesianIndex}([endpos])
    enqueue!(q,Tuple((endpos,0)));
    part2 = 0;
    while true
        pos,ngoes = dequeue!(q);
        for nextpos in candidates(pos,grid,explored)
            if part2 == 0 && grid[nextpos] in ['a','S']
                part2 = ngoes+1;
            end
            if grid[nextpos]=='S'
                return ngoes+1,part2
            end
            enqueue!(q,Tuple((nextpos,ngoes+1)));
            push!(explored,nextpos);
        end
    end
end

