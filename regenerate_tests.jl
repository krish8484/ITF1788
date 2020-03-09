using PyCall
# using Conda
# Conda.add("ply")
# Conda.add("yaml")
runpy = pyimport("runpy")
push!(pyimport("sys")."path", pwd())
mymodule = pyimport("itf1788")
runpy.run_module("itf1788", run_name="__main__")