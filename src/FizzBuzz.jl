__precompile__()

"""
Never Fail Another Interview™
"""
module FizzBuzz

export fizzbuzz, @fizzbuzz


"""
    fizzbuzz(iterable::AbstractArray)
    fizzbuzz(iterable::AbstractArray, io:IO)

FizzBuzz-ify an `iterable`. Optionally print to `io` instead of `STDOUT`.

```jldoctest fb_env
julia> using FizzBuzz

julia> fizzbuzz(1:5)
1
2
fizz
4
buzz

julia> io = IOBuffer();

julia> fizzbuzz(1:15, io)

julia> String(take!(io))
"1\\n2\\nfizz\\n4\\nbuzz\\nfizz\\n7\\n8\\nfizz\\nbuzz\\n11\\nfizz\\n13\\n14\\nfizz buzz\\n"
```
"""
function fizzbuzz(iterable::T, io::Union{Base.TTY, IO}=STDOUT) where T<:AbstractArray{<:Real}
    for i = iterable
        println(io, fizzbuzzer(i))
    end
end


"""
Private functions that compute return values for elements of `iterable`.
"""
function fizzbuzzer(v::T)::Union{T, String} where T<:Real
    if v % 15 == 0
        return "fizz buzz"
    elseif v % 5 == 0
        return "buzz"
    elseif v % 3 == 0
        return "fizz"
    else
        return v
    end
end

function fizzbuzzer(v::T)::Union{T, String} where T<:AbstractFloat
    if v % 15. == 0.
        return "fizz buzz"
    elseif v % 5. == 0.
        return "buzz"
    elseif v % 3. == 0.
        return "fizz"
    else
        return v
    end
end


"""
    @fizzbuzz iterable::AbstractArray
    @fizzbuzz iterable::AbstractArray io::IO

Macro version of `fizzbuzz()`.

```jldoctest fb_env
julia> @fizzbuzz 1:5
1
2
fizz
4
buzz
```
"""
macro fizzbuzz(iterable::Expr)
    return quote
        fizzbuzz($iterable)
    end
end

end  # module
