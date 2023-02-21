struct ClenshawCurtis{F, I} <: NestedQuadrature{F, I}
    n::I
    nodes::Vector{F}
    nested::BitVector
    weights::Vector{F}
    extended_weights::Vector{F}

    function ClenshawCurtis(float_type::Type{F}, n::I) where {F<:AbstractFloat, I<:Integer}
        if !(n > 1)
            throw(DomainError(n, "Ensure n > 1"))
        else
            n_extended = 2 * n - 1;
            nodes = clenshawcurtisnodes(float_type, n_extended);

            nested = falses(n_extended);
            for i in 1:2:n_extended
                nested[i] = true;
            end

            weights = clenshawcurtisweights(chebyshevmoments1(float_type, n));

            extended_weights = clenshawcurtisweights(chebyshevmoments1(float_type, n_extended));

            return new{float_type, I}(n, nodes, nested, weights, extended_weights)
        end
    end
end