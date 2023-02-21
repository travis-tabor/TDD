using TDD
using Test

a = Interval(1,5)

@testset "interval.jl" begin
    minimum(a) == 1
    maximum(a) == 5
end
