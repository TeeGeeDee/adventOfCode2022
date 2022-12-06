
@enum Shape rock=1 paper=2 scissors=3 # number is score for shape

const translator = Dict('A'=>rock,'B'=>paper,'C'=>scissors,'X'=>rock,'Y'=>paper,'Z'=>scissors);

function roundscore(opponentshape::Shape,myshape::Shape)::Int
    score = Integer(myshape);
    if myshape==opponentshape
        score += 3
    elseif Integer(myshape)==mod(Integer(opponentshape),3)+1
        score += 6
    end
    return score
end

function getbothscores(opponentschar::Char,mychar::Char)::Vector{Int}
    opponentshape = translator[opponentschar];
    myshape1 = translator[mychar];
    myshape2 = Shape(mod1(Integer(opponentshape) + Integer(myshape1)-2,3))
    return [roundscore(opponentshape,myshape1),roundscore(opponentshape,myshape2)]
end

function day02(file)
    return Tuple(sum(getbothscores(first(l),last(l)) for l in eachline(file)))
end