using FizzBuzz
using Base.Test

const fizzbuzzer = FizzBuzz.fizzbuzzer
const d = Dict(3 => "fizz", 5 => "buzz", 15 => "fizz buzz")

@testset "FizzBuzz" begin

    @testset "Test <:Integer returns $(d[v])" for v = [3, 5, 15]
        @test fizzbuzzer(v) == d[v]
    end

    @testset "Test <:AbstractFloat returns $(d[v])" for v = [3., 5., 15.]
        @test fizzbuzzer(v) == d[v]
    end

    @testset "Test <:Rational returns $(d[v])" for v = [3//1, 5//1, 15//1]
        @test fizzbuzzer(v) == d[v]
    end

    @testset "Test $v returns $v" for v = (1, 1., 1//1)
        @test fizzbuzzer(v) == v
    end

    @testset "Test UnitRange{<:Integer}" begin
        io = IOBuffer()
        fizzbuzz(1:15, io)
        @test String(take!(io)) == "1\n2\nfizz\n4\nbuzz\nfizz\n7\n8\nfizz\nbuzz\n11\nfizz\n13\n14\nfizz buzz\n"
        close(io)
    end

    @testset "Test UnitRange{<:AbstractFloat}" begin
        io = IOBuffer()
        fizzbuzz(1.:15., io)
        @test String(take!(io)) == "1.0\n2.0\nfizz\n4.0\nbuzz\nfizz\n7.0\n8.0\nfizz\nbuzz\n11.0\nfizz\n13.0\n14.0\nfizz buzz\n"
        close(io)
    end

    @testset "Test Array{<:Integer}" begin
        io = IOBuffer()
        fizzbuzz(collect(1:15), io)
        @test String(take!(io)) == "1\n2\nfizz\n4\nbuzz\nfizz\n7\n8\nfizz\nbuzz\n11\nfizz\n13\n14\nfizz buzz\n"
    end

    @testset "Test Array{<:AbstractFloat}" begin
        io = IOBuffer()
        fizzbuzz(collect(1.:15.), io)
        @test String(take!(io)) == "1.0\n2.0\nfizz\n4.0\nbuzz\nfizz\n7.0\n8.0\nfizz\nbuzz\n11.0\nfizz\n13.0\n14.0\nfizz buzz\n"
    end

    @testset "Test not divisible by 3 or 5 returns number" begin
        for v = 1:100
            while true
                r = rand(1:100_000, 1)[1]
                if r % 3 > 0 && r % 5 > 0
                    @test fizzbuzzer(r) == r
                    break
                end
            end
        end
    end

end
