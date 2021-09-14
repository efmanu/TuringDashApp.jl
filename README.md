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
![Animation5](https://user-images.githubusercontent.com/22251968/133246945-9850a1b2-869a-40c7-8ade-b33e901aa984.gif)

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