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
    currentfolder = Folder("/",nothing);
    directory = [currentfolder];
    for line = eachline(file)
        if startswith(line,raw"$ cd")
            to = line[6:end];
            if to=="/"
                currentfolder = directory[1];
            elseif to==raw".."
                currentfolder = currentfolder.parent;
            else
                currentfolder = only(c for c in currentfolder.children if c.name==to);
            end
        elseif line==raw"$ ls"
            # let the loop continue...
        else # must be following an ls
            a,name = split(line," ");
            if a=="dir"
                newchild = Folder(name,currentfolder);
                push!(directory,newchild);
            else
                newchild = File(name,parse(Int,a));
            end
            currentfolder.children = vcat(currentfolder.children,newchild);
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