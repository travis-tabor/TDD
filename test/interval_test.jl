using TDD
using Test

a = Interval(1,5)

@testset "interval.jl" begin
    typeof(a) == Interval
    minimum(a) == 1
    maximum(a) == 5
end
