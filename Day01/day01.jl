using DataStructures

K = 3

function day01(file)
    topk = BinaryMinMaxHeap{Int}(zeros(Int,K));
    while !eof(file)
        cal = getnextelfcalories(file);
        if cal>minimum(topk)
            popmin!(topk);
            push!(topk,cal);
        end
    end
    return maximum(topk),sum(popall!(topk))
end

function getnextelfcalories(file)
    cal = 0;
    while true
        line = readline(file); # returns empty at end of file
        if isempty(line)
            return cal
        end
        cal += parse(Int,line);
    end
end
