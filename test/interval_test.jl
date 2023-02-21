using TDD
using Test

a = Interval(1,5)

@testset "interval.jl" begin
    @test typeof(a) == Interval
    @test minimum(a) == 1
    @test maximum(a) == 5
end