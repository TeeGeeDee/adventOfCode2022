K = 3

function day01(file)
    topk = zeros(Int,K);
    latestelf = Iterators.takewhile(!isempty,eachline(file));
    while !eof(file)
        calories = sum(x->parse(Int,x),latestelf);
        i = findfirst(>(calories),topk);
        if isnothing(i) i = K+1; end # bigger than all
        if i>1 topk = [topk[2:i-1]; calories; topk[i:K]]; end
    end
    return topk[K],sum(topk)
end
