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

function Base.issubset(A::Interval, iv::Interval)
    if in(minimum(A), iv) && in(maximum(A), iv)
        return true
    elseif isempty(A)
        return true
    else
        return false
    end
end

function Base.intersect(A::Interval, iv:: Interval)
    if in(minimum(A), iv)
        b = minimum([maximum(A),maximum(iv)])
        return Interval(minimum(A), b)
    elseif in(minimum(iv), A)
        c = minimum([maximum(A),maximum(iv)])
        return Interval(minimum(iv),c)
    elseif in(maximum(A), iv)
        d = maximum([minimum(A),minimum(iv)])
        return Interval(d, maximum(A))
    elseif in(maximum(iv), A)
        e = maximum([minimum(A),minimum(iv)])
        return Interval(e, maximum(iv))
    else
        return "THe intervals don't overlap"
    end
end

Base.show(io::IO, iv::Interval) = print(io, "\u301a$(iv.low), $(iv.high)\u301b")