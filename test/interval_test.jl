using TDD
using Test

a = Interval(1,5)
b = Interval()

@testset "interval.jl" begin
    @test typeof(a) == Interval
    @test minimum(a) == 1
    @test maximum(a) == 5
    @test in(2.5, a)
    @test isempty(b)
end