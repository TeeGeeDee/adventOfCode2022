struct File
    name::String
    sz::Int
end

mutable struct Folder
    name::String
    parent::Union{Folder,Nothing} # root has nothing parent
    children::Vector{Union{Folder,File}}
    sz::Int
    Folder(name,parent) = new(name,parent,Vector{Union{Folder,File}}(),0);
end

function day07(file)
    wd = Folder("/",nothing);
    directory = [wd];
    for line = eachline(file)
        if startswith(line,raw"$ cd")
            to = @view line[6:end];
            if to=="/"
                wd = directory[1];
            elseif to==raw".."
                wd = wd.parent;
            else
                wd = only(c for c in wd.children if c.name==to);
            end
        elseif line==raw"$ ls"
            # let the loop continue...
        else # must be following an ls
            a,name = split(line," ");
            if a=="dir"
                newchild = Folder(name,wd);
                push!(directory,newchild);
            else
                newchild = File(name,parse(Int,a));
            end
            wd.children = vcat(wd.children,newchild);
        end
    end
    calcsize!(directory[1]); # populates sz of each Folder
    needtofree = 30000000-(70000000-directory[1].sz);
    return sum(f.sz for f in directory if f.sz<=100000),minimum(f.sz for f in directory if f.sz>=needtofree)
end

function calcsize!(f::Union{Folder,File})
    if typeof(f)==Folder
        f.sz = sum(calcsize!(c) for c in f.children);
    end
    return f.sz
end