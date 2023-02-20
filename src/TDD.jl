module TDD

# Write your package code here.

export direct_connect

function direct_connect(input::Vector, node::Integer)
    return sort(vcat(node,input[node]))
end
