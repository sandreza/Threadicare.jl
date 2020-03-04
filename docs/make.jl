using Documenter, Threadicare
push!(LOAD_PATH,"../src/")

format = Documenter.HTML(
    collapselevel = 1,
       prettyurls = get(ENV, "CI", nothing) == "true",
        canonical = "https://sandreza.github.io/Threadicare.jl/latest/"
)

makedocs(sitename="Documentation")
deploydocs(repo = "github.com/sandreza/Threadicare.jl.git")