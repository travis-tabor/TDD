using TDD
using Test

graph = [
          [2, 3],     # list of nodes that can be reached from node 1
          [1],        # list of nodes that can be reached from node 2
          [1],        # ", node 3
          [5],        # ", node 4
          [4]]        # ", node 5

@testset "TDD.jl" begin
    @test direct_connect(graph,1) == [1,2,3]
    @test direct_connect(graph,3) == [1,3]
    @test reachable(graph,3) == [1,2,3]
    @test reachable(graph,4) == [4,5]
end

