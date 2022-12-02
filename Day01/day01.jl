K = 3

function day01(file)
    topk = zeros(Int,K);
    latestelf = Iterators.takewhile(!isempty,eachline(file));
    while !eof(file)
        calories = sum(x->parse(Int,x),latestelf);
        i = findfirst(>(calories),topk);
        if isnothing(i) i = K; end # bigger than all
        if i>1 topk = [topk[2:i]; calories; topk[i+1:K]]; end
    end
    return topk[K],sum(topk)
end
