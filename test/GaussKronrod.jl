@testset "GaussKronrod" begin

    #type infeasible
    type = 1;
    @test_throws UndefVarError GaussKronrod(type,n)

    type = Float64;
    
    #degree infeasible
    n = 1;
    @test_throws DomainError GaussKronrod(type,n)

    n = 0;
    @test_throws DomainError GaussKronrod(type,n)

    n = -1;
    @test_throws DomainError GaussKronrod(type,n)

    #test example
    n = 6;
    tol = 1e-6

    f = x -> exp(x^3)+x^2+x;

    val = map(f, NestedQuadratures.GaussKronrod(type,n).higher_nodes);
    integral = sum(val .* NestedQuadratures.GaussKronrod(type,n).higher_weights);

    @test abs(integral - 2.816082266783757) < tol; 

end
