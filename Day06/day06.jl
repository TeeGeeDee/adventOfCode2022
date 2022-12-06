using DataStructures

function day06(file)
    message = readline(file);
    return findpacket(message,4),findpacket(message,14)
end

function findpacket(signal::String,packetlen::Int)::Int
    stream = Iterators.Stateful(signal);
    q = Deque{Char}();
    counts = counter(Char);
    for c in Iterators.take(stream,packetlen)
        push!(q,c);
        inc!(counts,c);
    end
    i = packetlen;
    while counts.map.count<packetlen
        out = popfirst!(q);
        dec!(counts,out);
        if counts[out]==0 reset!(counts,out); end
        push!(q,popfirst!(stream));
        inc!(counts,last(q));
        i += 1;
    end
    return i
end