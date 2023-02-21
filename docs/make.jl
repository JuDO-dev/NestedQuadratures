using NestedQuadratures
using Documenter

DocMeta.setdocmeta!(NestedQuadratures, :DocTestSetup, :(using NestedQuadratures); recursive=true)

makedocs(;
    modules=[NestedQuadratures],
    authors="astroEduardo <72969764+astroEduardo@users.noreply.github.com> and contributors",
    repo="https://github.com/JuDO-dev/NestedQuadratures.jl/blob/{commit}{path}#{line}",
    sitename="NestedQuadratures.jl",
    format=Documenter.HTML(;
        prettyurls=get(ENV, "CI", "false") == "true",
        canonical="https://JuDO-dev.github.io/NestedQuadratures.jl",
        edit_link="dev",
        assets=String[],
    ),
    pages=[
        "Home" => "index.md",
    ],
)

deploydocs(;
    repo="github.com/JuDO-dev/NestedQuadratures.jl",
    devbranch="dev",
)
