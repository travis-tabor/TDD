export direct_connect, reachable, components

function direct_connect(input::Vector, node::Integer)
    return sort(vcat(node, input[node]))
end

function reachable(input::Vector, node::Integer)
    visited = []
    stack = [node]
    while length(stack) > 0
        n = pop!(stack)
        if n ∉ visited
            push!(visited,n)
            stack = vcat(stack,direct_connect(input, n))
        else 
            continue
        end
    end
    return sort(visited)
end
    

function components(input)
    a = []
    for i in collect(1:length(input))
        a = push!(a,reachable(input,i))
    end

    out = []
    while length(a) > 0
        first, rest... = a

        af = -1
        while length(first) > af
            af = length(first)
            rest2 = []
            for r in rest
                if length(intersect(Set(first),Set(r)))>0
                    first = union(first,r)
                else
                    push!(rest2,r)
                end
            rest = rest2
            end
        push!(out,sort(first))
        a = rest
        end
    end
    return (unique(out))
end
            
