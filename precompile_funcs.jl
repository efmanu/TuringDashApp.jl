module PrecompileFuncs
    using TuringDash
    using TuringDash.Turing
    using TuringDash.Random
    using TuringDash.CSV, TuringDash.DataFrames

function precompile_turing()
    chn = Base.Channel{Vector{Float64}}(Inf)
    df1 = nothing
    global df1
    df1 = CSV.read(download("https://raw.githubusercontent.com/efmanu/TuringDashApp.jl/master/TuringDash/datasets/data1.csv"), DataFrame)
    model_str1 = """
    @model turingmodel(x, y) = begin
        a ~ Normal()
        b ~ Normal()
        for i in 1:length(x)
            y[i] ~ Normal(a + b * x[i], 1.0)
        end
    end
    """
    model_str2 = "turingmodel(x, y)"
    for colname in Symbol.(names(df1))
        @eval $colname = df1.$colname
    end
    
    eval(Meta.parse(model_str1))
    model = eval(Meta.parse(model_str2))

    alg = MH()
    rng = Random.GLOBAL_RNG

    nperiteration = 50
    nsamples = 20

    r = sample(rng, model, alg, nperiteration; chain_type=MCMCChains.Chains, save_state=true, progress=false)
    put!(chn, Array(r)[end,1:2])
    for i in (nperiteration + 1):nperiteration:nsamples
        r = Turing.Inference.resume(r, nperiteration, save_state=true, progress=false)
        put!(chn, Array(r)[end,1:2])
    end
    return "success"
end
end