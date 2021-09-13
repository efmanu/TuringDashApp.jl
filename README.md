# Dash Optim App
Web app to optimize various functions with the help of Dash.jl and Optim.jl

NB: Only functions with 2 parameters

### Run DashOptim App
From the project folder, enter the following commands in Julia REPL
```julia
    julia>using Pkg
    julia>Pkg.activate(".")
    julia>include("run.jl")
```
##### Step 1: Start Julia with project environment
![1](https://user-images.githubusercontent.com/22251968/132993635-4f1d52ce-07f7-404b-b442-3b98edb06f43.PNG)
##### Step 2: Run the app
![2](https://user-images.githubusercontent.com/22251968/132993640-8be6b1f4-1120-48b7-a422-ab123efb0b60.PNG)
##### Step 2: Open App in browser
![3](https://user-images.githubusercontent.com/22251968/132993642-e3b82795-1b00-4369-8115-4aad2e44f27b.PNG)
##### Step 2: Configurations for optimization
![Animation](https://user-images.githubusercontent.com/22251968/132994748-f696aee1-dc4c-43b4-8275-e78f1c5ce061.gif)

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