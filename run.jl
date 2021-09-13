# include("precompile_funcs.jl")

using TuringDash

# using .PrecompileFuncs
# PrecompileFuncs.precompile_turing()

app = TuringDash.make_app()

port = haskey(ENV, "PORT") ? parse(Int64, ENV["PORT"]) : 8050

TuringDash.Dash.run_server(app, "0.0.0.0", port)