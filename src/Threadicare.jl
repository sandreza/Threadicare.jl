module Threadicare

if VERSION < v"1.3"
    @error "Threadicare requires Julia v1.3 or newer."
end

using KernelAbstractions,
    BenchmarkTools,
    LinearAlgebra

import Base:
    +, -, *, /,
    size, length, eltype,
    iterate, similar, show,
    getindex, lastindex, setindex!,
    push!

end # module
