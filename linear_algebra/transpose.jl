using KernelAbstractions, Test, CUDAapi

@kernel function naive_transpose_kernel!(a, b)
    i, j = @index(Global, NTuple)
    a[i,j] = b[j,i]
end

function naive_transpose!(a, b; blocksize = 256)
    if size(a)[2] != size(b)[1]
        println("Matrix size mismatch!")
        return nothing
    end
    if size(a)[1] != size(b)[2]
        println("Matrix size mismatch!")
        return nothing
    end
    if isa(a, Array)
        kernel! = naive_transpose_kernel!(CPU(),4)
    else
        kernel! = naive_transpose_kernel!(CUDA(), blocksize)
    end
    kernel!(a, b, ndrange=size(a))
end

using BenchmarkTools, Revise, CuArrays
include("transpose.jl")

a = rand(8*1024,8*1024)
b = rand(8*1024, 8*1024)

if has_cuda_gpu()
    d_a = CuArray(a)
    d_b = CuArray(b)

    #@benchmark  wait(naive_transpose!($d_a,$d_b))                                                                                                                
    #@benchmark  wait(naive_transpose!($d_a,$d_b, blocksize=(32,32)))
    naive_transpose!(d_a, d_b)
    @test all(d_a.==d_b')
end
