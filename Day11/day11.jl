using DataStructures

mutable struct Monkey
    items::Deque{Int}
    operation
    testdivisibleby::Int
    monkeyto::Tuple{Int,Int}
    ninspections::Int
    function Monkey(text)
        items = [parse(Int,m.match) for m in eachmatch(r"([0-9]+)",text[2])];
        divby = parse(Int,match(r"([0-9]+)",text[4]).match);
        monkeyto = Tuple(parse(Int,match(r"([0-9]+)",line).match) for line in text[5:6]);
        op,arg = match(r"old (\+|\-|\*|\+) (old|[0-9]+)",text[3]).captures;
        if     op=="+" f = +;
        elseif op=="-" f = -;
        elseif op=="*" f = *;
        elseif op=="÷" f = ÷;
        end
        if arg=="old";
            func = x->f(x,x);
        else
            func = x->f(x,parse(Int,arg));
        end
        itemsq = Deque{Int}();
        for i in items
            push!(itemsq,i);
        end
        new(itemsq,func,divby,monkeyto,0);
    end
end

function day11(file)
    latestmonkey = Iterators.takewhile(!isempty,eachline(file));
    monkeys = []; # ::Vector{Monkey}
    while !eof(file)
        push!(monkeys,Monkey([line for line in latestmonkey]));
    end
    for _ in 1:20, i = 1:length(monkeys)
        taketurn!(monkeys[i],monkeys);
    end
    inspections = sort([m.ninspections for m in monkeys],rev=true);
    return inspections[1]*inspections[2]
end

function taketurn!(m::Monkey,monkeys)
    while !isempty(m.items)
        x = popfirst!(m.items);
        x = m.operation(x)÷3;
        indto =  x % m.testdivisibleby ==0 ? 1 : 2;
        push!(monkeys[m.monkeyto[indto]+1].items,x);
        m.ninspections += 1;
    end
end