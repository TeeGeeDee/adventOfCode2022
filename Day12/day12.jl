using DataStructures

const MOVES = [CartesianIndex(0,1), CartesianIndex(1,0), CartesianIndex(0,-1), CartesianIndex(-1,0)]

height(c::Char) = c=='S' ? 'a' : (c=='E' ? 'z' : c);

candidates(pos::CartesianIndex,grid::Matrix{Char},explored::Set{CartesianIndex}) = [i for i in setdiff([pos+mv for mv in MOVES],explored)
                            if checkbounds(Bool,grid,i) && height(grid[i])<=height(grid[pos])+1];

function day12(file)
    grid = permutedims(reduce(hcat,collect.(readlines(file))));
    q = Queue{Tuple{CartesianIndex,Int}}();
    start = only(findall(grid.=='S'));
    explored = Set{CartesianIndex}([start])
    enqueue!(q,Tuple((start,0)));
    while true
        pos,ngoes = dequeue!(q);
        for nextpos in candidates(pos,grid,explored)
            if grid[nextpos]=='E'
                return ngoes+1
            end
            enqueue!(q,Tuple((nextpos,ngoes+1)));
            push!(explored,nextpos);
        end
    end
end

