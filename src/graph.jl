export direct_connect, reachable

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
    
     