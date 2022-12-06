using DataStructures

function day06(file)
    message = readline(file);
    return findpacket(message,4),findpacket(message,14)
end

function findpacket(signal::String,packetlen::Int)::Int
    q = Deque{Char}();
    counts = counter(Char);
    for (i,c) in enumerate(signal)
        push!(q,c);
        inc!(counts,c);
        if i>packetlen
            out = popfirst!(q);
            dec!(counts,out);
            if counts[out]==0 reset!(counts,out); end
        end
        if counts.map.count==packetlen
            return i
        end
    end
end