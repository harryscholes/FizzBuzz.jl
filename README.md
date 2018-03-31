# FizzBuzz

[![Build Status](https://travis-ci.org/harryscholes/FizzBuzz.jl.svg?branch=master)](https://travis-ci.org/harryscholes/FizzBuzz.jl)

[![Coverage Status](https://coveralls.io/repos/harryscholes/FizzBuzz.jl/badge.svg?branch=master&service=github)](https://coveralls.io/github/harryscholes/FizzBuzz.jl?branch=master)

[![codecov.io](http://codecov.io/github/harryscholes/FizzBuzz.jl/coverage.svg?branch=master)](http://codecov.io/github/harryscholes/FizzBuzz.jl?branch=master)


## Usage

```julia
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

julia> @fizzbuzz 1:5
1
2
fizz
4
buzz
```
