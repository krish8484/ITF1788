using IntervalArithmetic
using Base.Filesystem
using Glob

output_file_path = joinpath(dirname(dirname(pathof(IntervalArithmetic))), "test", "ITF1788_tests")
input_file_path = joinpath("output", "julia", "Base.Test", "ValidatedNumerics")
files = glob("*.jl", input_file_path)

for file in files
    bname = basename(file)
    filepath = joinpath(input_file_path, bname)
    ofilepath = joinpath(output_file_path, bname)
    cp(filepath, ofilepath; force=true)
end

