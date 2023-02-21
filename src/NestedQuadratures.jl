module NestedQuadratures

using FastTransforms: clenshawcurtisnodes, chebyshevmoments1, clenshawcurtisweights

abstract type NestedQuadrature{F<:AbstractFloat, I<:Integer} end

# Clenshaw-Curtis
include("ClenshawCurtis.jl")
export ClenshawCurtis

end