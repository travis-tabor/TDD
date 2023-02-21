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

function Base.in(x::Real, iv::Interval)
    return iv.low <= x <= iv.high
end

function Base.isempty(iv::Interval)
    if iv.low >= iv.high
        return true
    else
        return false
    end
end