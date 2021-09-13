# Turing Dash App
Web app for Bayesian inference using  Dash.jl and Turing.jl 


### Run TuringDash App
From the project folder, enter the following commands in Julia REPL
```julia
    julia>using Pkg
    julia>Pkg.activate(".")
    julia>include("run.jl")
```

##### Step 2: Configurations for sampling
![Animation4](https://user-images.githubusercontent.com/22251968/133113047-30aae141-bd81-417d-bde5-832ac4de3797.gif)

### Deploy in Herokuapp
From the project folder, enter the following commands in command line/terminal etc.
```
heroku login #then login to heroku app with your credentials
git push heroku master
```
Sometimes push won't work, then do

```
git push heroku master:master -f
```