using DataStructures

function day01(file)
    h = MutableBinaryMaxHeap{Int}();
    thiscal = 0;
    for l in readlines(file)
        if isempty(l)
            push!(h,thiscal);
            thiscal = 0;
        else
            thiscal += parse(Int,l);
        end
    end
    push!(h,thiscal); # last elf
    return first(h),sum(pop!(h) for _ in 1:3)
end