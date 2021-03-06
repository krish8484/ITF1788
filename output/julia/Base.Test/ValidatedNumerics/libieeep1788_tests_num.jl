#=
 Copyright 2013 - 2015 Marco Nehmeier (nehmeier@informatik.uni-wuerzburg.de)
 Copyright 2015 Oliver Heimlich (oheim@posteo.de)
 
 Original author: Marco Nehmeier (unit tests in libieeep1788)
 Converted into portable ITL format by Oliver Heimlich with minor corrections.
 
 Licensed under the Apache License, Version 2.0 (the "License");
 you may not use this file except in compliance with the License.
 You may obtain a copy of the License at
 
     http://www.apache.org/licenses/LICENSE-2.0
 
 Unless required by applicable law or agreed to in writing, software
 distributed under the License is distributed on an "AS IS" BASIS,
 WITHOUT WARRANTIES OR CONDITIONS OF ANY KIND, either express or implied.
 See the License for the specific language governing permissions and
 limitations under the License.
=#
#Language imports

#Test library imports
using Base.Test

#Arithmetic library imports
using ValidatedNumerics

#Preamble
setprecision(53)
setprecision(Interval, Float64)
setrounding(Interval, :narrow)

@testset "minimal_inf_test" begin
    @test infimum(∅) == Inf
    @test infimum(Interval(-Inf, Inf)) == -Inf
    @test infimum(Interval(1.0, 2.0)) == 1.0
    @test infimum(Interval(-3.0, -2.0)) == -3.0
    @test infimum(Interval(-Inf, 2.0)) == -Inf
    @test infimum(Interval(-Inf, 0.0)) == -Inf
    @test infimum(Interval(-Inf, -0.0)) == -Inf
    @test infimum(Interval(-2.0, Inf)) == -2.0
    @test infimum(Interval(0.0, Inf)) == -0.0
    @test infimum(Interval(-0.0, Inf)) == -0.0
    @test infimum(Interval(-0.0, 0.0)) == -0.0
    @test infimum(Interval(0.0, -0.0)) == -0.0
    @test infimum(Interval(0.0, 0.0)) == -0.0
    @test infimum(Interval(-0.0, -0.0)) == -0.0
end

@testset "minimal_inf_dec_test" begin
    @test infimum(DecoratedInterval(∅, trv)) == Inf
    @test infimum(DecoratedInterval(Interval(-Inf, Inf), def)) == -Inf
    @test infimum(DecoratedInterval(Interval(1.0, 2.0), com)) == 1.0
    @test infimum(DecoratedInterval(Interval(-3.0, -2.0), trv)) == -3.0
    @test infimum(DecoratedInterval(Interval(-Inf, 2.0), dac)) == -Inf
    @test infimum(DecoratedInterval(Interval(-Inf, 0.0), def)) == -Inf
    @test infimum(DecoratedInterval(Interval(-Inf, -0.0), trv)) == -Inf
    @test infimum(DecoratedInterval(Interval(-2.0, Inf), trv)) == -2.0
    @test infimum(DecoratedInterval(Interval(0.0, Inf), def)) == -0.0
    @test infimum(DecoratedInterval(Interval(-0.0, Inf), trv)) == -0.0
    @test infimum(DecoratedInterval(Interval(-0.0, 0.0), dac)) == -0.0
    @test infimum(DecoratedInterval(Interval(0.0, -0.0), trv)) == -0.0
    @test infimum(DecoratedInterval(Interval(0.0, 0.0), trv)) == -0.0
    @test infimum(DecoratedInterval(Interval(-0.0, -0.0), trv)) == -0.0
end

@testset "minimal_sup_test" begin
    @test supremum(∅) == -Inf
    @test supremum(Interval(-Inf, Inf)) == Inf
    @test supremum(Interval(1.0, 2.0)) == 2.0
    @test supremum(Interval(-3.0, -2.0)) == -2.0
    @test supremum(Interval(-Inf, 2.0)) == 2.0
    @test supremum(Interval(-Inf, 0.0)) == 0.0
    @test supremum(Interval(-Inf, -0.0)) == 0.0
    @test supremum(Interval(-2.0, Inf)) == Inf
    @test supremum(Interval(0.0, Inf)) == Inf
    @test supremum(Interval(-0.0, Inf)) == Inf
    @test supremum(Interval(-0.0, 0.0)) == 0.0
    @test supremum(Interval(0.0, -0.0)) == 0.0
    @test supremum(Interval(0.0, 0.0)) == 0.0
    @test supremum(Interval(-0.0, -0.0)) == 0.0
end

@testset "minimal_sup_dec_test" begin
    @test supremum(DecoratedInterval(∅, trv)) == -Inf
    @test supremum(DecoratedInterval(Interval(-Inf, Inf), def)) == Inf
    @test supremum(DecoratedInterval(Interval(1.0, 2.0), com)) == 2.0
    @test supremum(DecoratedInterval(Interval(-3.0, -2.0), trv)) == -2.0
    @test supremum(DecoratedInterval(Interval(-Inf, 2.0), dac)) == 2.0
    @test supremum(DecoratedInterval(Interval(-Inf, 0.0), def)) == 0.0
    @test supremum(DecoratedInterval(Interval(-Inf, -0.0), trv)) == 0.0
    @test supremum(DecoratedInterval(Interval(-2.0, Inf), trv)) == Inf
    @test supremum(DecoratedInterval(Interval(0.0, Inf), def)) == Inf
    @test supremum(DecoratedInterval(Interval(-0.0, Inf), trv)) == Inf
    @test supremum(DecoratedInterval(Interval(-0.0, 0.0), dac)) == +0.0
    @test supremum(DecoratedInterval(Interval(0.0, -0.0), trv)) == +0.0
    @test supremum(DecoratedInterval(Interval(0.0, 0.0), trv)) == +0.0
    @test supremum(DecoratedInterval(Interval(-0.0, -0.0), trv)) == +0.0
end

@testset "minimal_mid_test" begin
    @test mid(Interval(-Inf, Inf)) == 0.0
    @test mid(Interval(-0x1.fffffffffffffp1023, +0x1.fffffffffffffp1023)) == 0.0
    @test mid(Interval(0.0, 2.0)) == 1.0
    @test mid(Interval(2.0, 2.0)) == 2.0
    @test mid(Interval(-2.0, 2.0)) == 0.0
    @test mid(Interval(-0x0.0000000000002p-1022, 0x0.0000000000001p-1022)) == 0.0
    @test mid(Interval(-0x0.0000000000001p-1022, 0x0.0000000000002p-1022)) == 0.0
end

@testset "minimal_mid_dec_test" begin
    @test mid(DecoratedInterval(Interval(-Inf, Inf), def)) == 0.0
    @test mid(DecoratedInterval(Interval(-0x1.fffffffffffffp1023, +0x1.fffffffffffffp1023), trv)) == 0.0
    @test mid(DecoratedInterval(Interval(0.0, 2.0), com)) == 1.0
    @test mid(DecoratedInterval(Interval(2.0, 2.0), dac)) == 2.0
    @test mid(DecoratedInterval(Interval(-2.0, 2.0), trv)) == 0.0
    @test mid(DecoratedInterval(Interval(-0x0.0000000000002p-1022, 0x0.0000000000001p-1022), trv)) == 0.0
    @test mid(DecoratedInterval(Interval(-0x0.0000000000001p-1022, 0x0.0000000000002p-1022), trv)) == 0.0
end

@testset "minimal_rad_test" begin
    @test radius(Interval(0.0, 2.0)) == 1.0
    @test radius(Interval(2.0, 2.0)) == 0.0
    @test radius(Interval(-Inf, Inf)) == Inf
    @test radius(Interval(0.0, Inf)) == Inf
    @test radius(Interval(-Inf, 1.2)) == Inf
end

@testset "minimal_rad_dec_test" begin
    @test radius(DecoratedInterval(Interval(0.0, 2.0), trv)) == 1.0
    @test radius(DecoratedInterval(Interval(2.0, 2.0), com)) == 0.0
    @test radius(DecoratedInterval(Interval(-Inf, Inf), trv)) == Inf
    @test radius(DecoratedInterval(Interval(0.0, Inf), def)) == Inf
    @test radius(DecoratedInterval(Interval(-Inf, 1.2), trv)) == Inf
end

@testset "minimal_wid_test" begin
    @test diam(Interval(2.0, 2.0)) == 0.0
    @test diam(Interval(1.0, 2.0)) == 1.0
    @test diam(Interval(1.0, Inf)) == Inf
    @test diam(Interval(-Inf, 2.0)) == Inf
    @test diam(Interval(-Inf, Inf)) == Inf
end

@testset "minimal_wid_dec_test" begin
    @test diam(DecoratedInterval(Interval(2.0, 2.0), com)) == 0.0
    @test diam(DecoratedInterval(Interval(1.0, 2.0), trv)) == 1.0
    @test diam(DecoratedInterval(Interval(1.0, Inf), trv)) == Inf
    @test diam(DecoratedInterval(Interval(-Inf, 2.0), def)) == Inf
    @test diam(DecoratedInterval(Interval(-Inf, Inf), trv)) == Inf
end

@testset "minimal_mag_test" begin
    @test mag(Interval(1.0, 2.0)) == 2.0
    @test mag(Interval(-4.0, 2.0)) == 4.0
    @test mag(Interval(-Inf, 2.0)) == Inf
    @test mag(Interval(1.0, Inf)) == Inf
    @test mag(Interval(-Inf, Inf)) == Inf
    @test mag(Interval(-0.0, 0.0)) == 0.0
    @test mag(Interval(-0.0, -0.0)) == 0.0
end

@testset "minimal_mag_dec_test" begin
    @test mag(DecoratedInterval(Interval(1.0, 2.0), com)) == 2.0
    @test mag(DecoratedInterval(Interval(-4.0, 2.0), trv)) == 4.0
    @test mag(DecoratedInterval(Interval(-Inf, 2.0), trv)) == Inf
    @test mag(DecoratedInterval(Interval(1.0, Inf), def)) == Inf
    @test mag(DecoratedInterval(Interval(-Inf, Inf), trv)) == Inf
    @test mag(DecoratedInterval(Interval(-0.0, 0.0), trv)) == 0.0
    @test mag(DecoratedInterval(Interval(-0.0, -0.0), trv)) == 0.0
end

@testset "minimal_mig_test" begin
    @test mig(Interval(1.0, 2.0)) == 1.0
    @test mig(Interval(-4.0, 2.0)) == 0.0
    @test mig(Interval(-4.0, -2.0)) == 2.0
    @test mig(Interval(-Inf, 2.0)) == 0.0
    @test mig(Interval(-Inf, -2.0)) == 2.0
    @test mig(Interval(-1.0, Inf)) == 0.0
    @test mig(Interval(1.0, Inf)) == 1.0
    @test mig(Interval(-Inf, Inf)) == 0.0
    @test mig(Interval(-0.0, 0.0)) == 0.0
    @test mig(Interval(-0.0, -0.0)) == 0.0
end

@testset "minimal_mig_dec_test" begin
    @test mig(DecoratedInterval(Interval(1.0, 2.0), com)) == 1.0
    @test mig(DecoratedInterval(Interval(-4.0, 2.0), trv)) == 0.0
    @test mig(DecoratedInterval(Interval(-4.0, -2.0), trv)) == 2.0
    @test mig(DecoratedInterval(Interval(-Inf, 2.0), def)) == 0.0
    @test mig(DecoratedInterval(Interval(-Inf, -2.0), trv)) == 2.0
    @test mig(DecoratedInterval(Interval(-1.0, Inf), trv)) == 0.0
    @test mig(DecoratedInterval(Interval(1.0, Inf), trv)) == 1.0
    @test mig(DecoratedInterval(Interval(-Inf, Inf), trv)) == 0.0
    @test mig(DecoratedInterval(Interval(-0.0, 0.0), trv)) == 0.0
    @test mig(DecoratedInterval(Interval(-0.0, -0.0), trv)) == 0.0
end
# FactCheck.exitstatus()
