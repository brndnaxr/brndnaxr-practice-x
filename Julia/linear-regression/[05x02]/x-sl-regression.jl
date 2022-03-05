############################################################################################
### Non-Machine Learning Approach
############################################################################################

### packages

using CSV, GLM, Plots, TypedTables

### use CSV package to import data from CSV file

data = CSV.File("housingdata.csv")

X = data.size

Y = round.(Int, data.price / 1000)

t = Table(X = X, Y =Y)

### use Plots package to generate sctter plot of data

gr(size = (600, 600))

### create scatter plot

p_scatter = scatter(X, Y,
    xlims = (0, 5000),
    ylims = (0, 800),
    xlabel = "Size (sqft)",
    ylabel = "Housing Prices in Portland",
    legend = false,
    color = :red
)

### use GLM package for linear regression model

ols = lm(@formula(Y ~ X), t)

############################################################################################
### Machine Learning Approach
############################################################################################

epochs = 0

### create scatter plot

p_scatter = scatter(X, Y,
    xlims = (0, 5000),
    ylims = (0, 800),
    xlabel = "Size (sqft)",
    ylabel = "Price (in thousands of dollars)",
    title = "Housing Prices in Portland (epochs = $epochs)",
    legend = false,
    color = :red
)

### initialize parameters

theta_0 = 0.0  # y-intercept

theta_1 = 0.0  # slope

### define linear regression model
h(x) = theta_0 + theta_1 * x # linear regression model

plot!(X, h(X), color = :blue, linewidth = 3)





