export Interval

struct Interval
    low::Real
    high::Real
end

function Base.minimum(iv::Interval)
    return iv.low
end

function Base.maximum(iv::Interval)
    return iv.high
end
