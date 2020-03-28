

"""
test_args(args...; keyword = "keyword")

# Description
- Tests splat and keyword arguments

# Argument
- args... : Whatever your heart desires

# Keyword Arguments
- keyword: default value = "keyword"

# Return
- Nothing
"""
function test_args(args...; keyword = "keyword")
    println("The function argument is $args")
    println("The members are")
    for i in args
        println(i)
    end
    println("The keyword argument is ")
    println(keyword)
    return nothing
end
