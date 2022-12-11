using DataStructures

mutable struct Monkey
    items::Queue{Int}
    operation::Function
    testdivisibleby::Int
    monkeyto::Tuple{Int,Int}
    ninspections::Int
    function Monkey(text)
        items = [parse(Int,m.match) for m in eachmatch(r"([0-9]+)",text[2])];
        divby = parse(Int,match(r"([0-9]+)",text[4]).match);
        monkeyto = Tuple(1+parse(Int,match(r"([0-9]+)",line).match) for line in text[5:6]); # 1+ to move to 1-indexing
        op,arg = match(r"old (\+|\-|\*|\+) (old|[0-9]+)",text[3]).captures;
        if     op=="+" f = +;
        elseif op=="-" f = -;
        elseif op=="*" f = *;
        end
        if arg=="old"
            func = x->f(x,x);
        else
            v = parse(Int,arg);
            func = x->f(x,v);
        end
        itemsq = Queue{Int}();
        for i in items
            enqueue!(itemsq,i);
        end
        new(itemsq,func,divby,monkeyto,0);
    end
end

function day11(file)
    latestmonkey = Iterators.takewhile(!isempty,eachline(file));
    monkeys::Vector{Monkey} = [];
    while !eof(file)
        push!(monkeys,Monkey(collect(latestmonkey)));
    end
    base = lcm([m.testdivisibleby for m in monkeys]...);
    monkeys2 = deepcopy(monkeys);
    playrounds!(monkeys,true,base);
    playrounds!(monkeys2,false,base);
    return prod(partialsort([m.ninspections for m in monkeys],1:2,rev=true)),
           prod(partialsort([m.ninspections for m in monkeys2],1:2,rev=true))
end

function playrounds!(monkeys::Vector{Monkey},ispart1::Bool,denom::Int)
    for _ in 1:(ispart1 ? 20 : 10_000)
        for m in monkeys
            while !isempty(m.items)
                x = dequeue!(m.items);
                x = m.operation(x);
                if ispart1
                    x ÷= 3;
                else
                    x = mod(x,denom);
                end
                indto =  x % m.testdivisibleby == 0 ? 1 : 2;
                enqueue!(monkeys[m.monkeyto[indto]].items,x);
                m.ninspections += 1;
            end
        end
    end
end