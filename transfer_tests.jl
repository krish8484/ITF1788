using IntervalArithmetic
using Base.Filesystem

output_file_path = joinpath(dirname(dirname(pathof(IntervalArithmetic))), "test", "ITF1788_tests")
input_file_path = joinpath(@__DIR__, "output", "julia", "Base.Test", "ValidatedNumerics")
files = readdir(relpath(input_file_path, @__DIR__))

for file in files
    if(file=="Makefile")
        continue
    end
    filepath = joinpath(input_file_path, file)
    ofilepath = joinpath(output_file_path, file)
    cp(relpath(filepath, @__DIR__), ofilepath; force=true)
end

