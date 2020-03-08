using PyCall
runpy = pyimport("runpy")
push!(pyimport("sys")."path", pwd())
mymodule = pyimport("itf1788")
runpy.run_module("itf1788")