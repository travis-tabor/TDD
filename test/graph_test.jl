using TDD
using Test

graph = [
          [2, 3],     # list of nodes that can be reached from node 1
          [1],        # list of nodes that can be reached from node 2
          [1],        # ", node 3
          [5],        # ", node 4
          [4]]        # ", node 5

directed_graph = [
          [3],     # list of nodes that can be reached from node 1
          [1],        # list of nodes that can be reached from node 2
          []]        # ", node 3

adj = Bool[
    1 1 1 0 0;
    1 1 0 0 0;
    1 0 1 0 0;
    0 0 0 1 1;
    0 0 0 1 1;
]

adj2 = Bool[
    0 1 1 0 0;
    1 0 0 0 0;
    1 0 0 0 0;
    0 0 0 0 1;
    0 0 0 1 0;
]

@testset "graph_test.jl" begin
    @test direct_connect(graph,1) == [1,2,3]
    @test direct_connect(directed_graph,1) == [1,3]
    @test direct_connect(graph,3) == [1,3]
    @test direct_connect(directed_graph, 3) == [3]
    @test reachable(graph,1) == [1,2,3]
    @test reachable(directed_graph, 1) == [1,3]
    @test reachable(graph,3) == [1,2,3]
    @test reachable(directed_graph, 3) == [3]
    @test reachable(directed_graph, 2) == [1,2,3]
    @test components(graph) == [[1,2,3],[4,5]]
    @test components(directed_graph) == [[1,2,3]]

    @test direct_connect(adj,1) == [1,2,3]
    @test direct_connect(adj,3) == [1,3]
    @test reachable(adj,1) == [1,2,3]
    @test reachable(adj,3) == [1,2,3]
    @test components(adj) == [[1,2,3],[4,5]]

    @test direct_connect(adj2,1) == [1,2,3]
    @test direct_connect(adj2,3) == [1,3]
    @test reachable(adj2,1) == [1,2,3]
    @test reachable(adj2,3) == [1,2,3]
    @test components(adj2) == [[1,2,3],[4,5]]
 end
