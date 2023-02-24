module NestedQuadratures

using FastTransforms: clenshawcurtisnodes, chebyshevmoments1, clenshawcurtisweights
using QuadGK: kronrod

abstract type NestedQuadrature{F<:AbstractFloat, I<:Integer} end

# Clenshaw-Curtis
include("ClenshawCurtis.jl")
export ClenshawCurtis

# Gauss-Kronrod
include("GaussKronrod.jl")
export GaussKronrod

end
