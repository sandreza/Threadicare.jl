using Documenter, Threadicare

makedocs(
     modules = [Threadicare],
       clean = true,
     doctest = false,
   checkdocs = :all,
      format = Documenter.HTML(prettyurls = get(ENV, "CI", nothing) == "true"),
     authors = "Andre N. Souza",
    sitename = "Threadicare.jl",

       pages = Any[
                "Home" => "index.md"
                      ]
)

deploydocs(
  repo = "github.com/sandreza/Threadicare.jl.git",
)
