using TDD
using Test

a = Interval(1,5)
b = Interval(5,3)
c = Interval(1,3)
d = Interval(3,6)

@testset "interval.jl" begin
    @test typeof(a) == Interval
    @test minimum(a) == 1
    @test maximum(a) == 5
    @test in(2.5, a)
    @test isempty(b)
    @test issubset(c,a) == true
    @test issubset(d,a) == false
    @test issubset(b,a) == true
    @test issubset(a,a) == true
    @test intersect(a,c) == Interval(1,3)
    @test intersect(a,d) == Interval(3,5)
    @test repr("text/plain", a) == "\u301a$(a.low), $(a.high)\u301b" 
    @test repr("text/plain", b) == "∅"
end