module TDD

# Write your package code here.

export direct_connect

function direct_connect(input::Vector, node::Integer)
    return sort(unique((vcat(node, input[node], findall(i->(node in i), input)))))
end

end
