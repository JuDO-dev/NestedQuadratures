struct GaussKronrod{F,I} <: NestedQuadrature{F,I}  
    n::I                                    
    nodes::Vector{F}
    weights::Vector{F}
    higher_nodes::Vector{F}
    higher_weights::Vector{F}
    nested::BitVector

    function GaussKronrod(float_type::Type{F}, n::I) where {F<:AbstractFloat, I<:Integer}  

        if !(n>1)
            throw(DomainError(n, "Ensure degree is greater than 1"))
        else

            (GK_nodes, K_weights, G_weights) = kronrod(n);
            higher_nodes = vcat(GK_nodes[1:end], -GK_nodes[end-1:-1:1]);
            higher_weights = vcat(K_weights[1:end], K_weights[end-1:-1:1]);
            nodes = higher_nodes[2:2:end];

            nested = falses(length(higher_nodes));
            for i in 2:2:length(higher_nodes)
                nested[i] = true;
            end
            

            if iseven(n)
                weights = vcat(G_weights[1:end], G_weights[end:-1:1]);
            else 
                weights = vcat(G_weights[1:end], G_weights[end-1:-1:1]);
            end

            return new{float_type, I}(n, nodes, weights, higher_nodes, higher_weights, nested)

        end
    end
end