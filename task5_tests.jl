include("task5.jl")


function test()
    println("First test on an array with 50 000 elements")
    v = Int.(round.(randn(50000)*1000))
    println("Bubble sort ", @elapsed bubble_sort!(copy(v)))
    println("Calc sort ", @elapsed calc_sort!(copy(v)))
    println("Comb sort ", @elapsed comb_sort!(copy(v)))
    println("Shell sort ", @elapsed shell_sort!(copy(v)))
    println("Merge sort ", @elapsed merge_sort!(copy(v)))
    println("Heap sort ", @elapsed heap_sort!(copy(v)))
    println("Quick sort ", @elapsed quick_sort!(copy(v)))
    println("Sort ", @elapsed sort!(copy(v)))

    println()
    println("Second test on an array with 500 000 elements")
    v = Int.(round.(rand(500000)*10000))
    println("Calc sort ", @elapsed calc_sort!(copy(v)))
    println("Comb sort ", @elapsed comb_sort!(copy(v)))
    println("Shell sort ", @elapsed shell_sort!(copy(v)))
    println("Merge sort ", @elapsed merge_sort!(copy(v)))
    println("Heap sort ", @elapsed heap_sort!(copy(v)))
    println("Quick sort ", @elapsed quick_sort!(copy(v)))
    println("Sort ", @elapsed sort!(copy(v)))

    println()
    println("Third test on an array with 4 000 000 elements")
    v = Int.(round.(rand(4000000)*100000))
    println("Calc sort ", @elapsed calc_sort!(copy(v)))
    println("Comb sort ", @elapsed comb_sort!(copy(v)))
    println("Shell sort ", @elapsed shell_sort!(copy(v)))
    println("Merge sort ", @elapsed merge_sort!(copy(v)))
    println("Heap sort ", @elapsed heap_sort!(copy(v)))
    println("Quick sort ", @elapsed quick_sort!(copy(v)))
    println("Sort ", @elapsed sort!(copy(v)))

    println()
    println("Third test on an array with 20 000 000 elements")
    v = Int.(round.(rand(20000000)*100000))
    println("Calc sort ", @elapsed calc_sort!(copy(v)))
    println("Comb sort ", @elapsed comb_sort!(copy(v)))
    println("Shell sort ", @elapsed shell_sort!(copy(v)))
    println("Merge sort ", @elapsed merge_sort!(copy(v)))
    println("Heap sort ", @elapsed heap_sort!(copy(v)))
    println("Quick sort ", @elapsed quick_sort!(copy(v)))
    println("Sort ", @elapsed sort!(copy(v)))
    
    println()
    println("Fifth test on an array with 100 000 000 elements")
    v = Int.(round.(rand(100_000_000)*100_000))
    println("Calc sort ", @elapsed calc_sort!(copy(v)))
    println("Comb sort ", @elapsed comb_sort!(copy(v)))
    println("Shell sort ", @elapsed shell_sort!(copy(v)))
    println("Merge sort ", @elapsed merge_sort!(copy(v)))
    println("Heap sort ", @elapsed heap_sort!(copy(v)))
    println("Quick sort ", @elapsed quick_sort!(copy(v)))
    println("Sort ", @elapsed sort!(copy(v)))
    
    println()
    println("Sixth test on an array with 50 000 000 elements with 100 000 000 diferent elements")
    v = Int.(round.(rand(50000000)*100000000))
    println("Calc sort ", @elapsed calc_sort!(copy(v)))
    println("Comb sort ", @elapsed comb_sort!(copy(v)))
    println("Shell sort ", @elapsed shell_sort!(copy(v)))
    println("Merge sort ", @elapsed merge_sort!(copy(v)))
    println("Heap sort ", @elapsed heap_sort!(copy(v)))
    println("Quick sort ", @elapsed quick_sort!(copy(v)))
    println("Sort ", @elapsed sort!(copy(v)))

end

#=
First test on an array with 50 000 elements
Bubble sort 4.2383702
Calc sort 0.0006244
Comb sort 0.0062715
Shell sort 0.0082369
Merge sort 0.0077952
Heap sort 0.0019047
Quick sort 0.0038359
Sort 0.0010301

Second test on an array with 500 000 elements
Calc sort 0.0031904
Comb sort 0.0808271
Shell sort 0.1301163
Merge sort 0.1338391
Heap sort 0.0323357
Quick sort 0.0447786
Sort 0.0041384

Third test on an array with 4 000 000 elements
Calc sort 0.0348593
Comb sort 0.674838
Shell sort 1.5103394
Merge sort 0.9224523
Heap sort 0.254693
Quick sort 0.4506442
Sort 0.0407753

Third test on an array with 20 000 000 elements
Calc sort 1.041081
Comb sort 3.4190871
Shell sort 9.2116537
Merge sort 4.3163647
Heap sort 1.2267998
Quick sort 1.9800041
Sort 0.1598909

Fifth test on an array with 100 000 000 elements
Calc sort 1.9612027
Comb sort 16.0134754
Shell sort 58.4841261
Merge sort 22.166739
Heap sort 5.6003875
Quick sort 9.7421896
Sort 0.7578638

Sixth test on an array with 50 000 000 elements with 100 000 000 diferent elements
Calc sort 2.2772719
Comb sort 9.416126
Shell sort 26.1404793
Merge sort 11.6047742
Heap sort 2.6997853
Quick sort 9.4264314
Sort 1.7460758
=#




function test2()
    println("First test on an array with 50 000 elements")
    v = Int.(round.(randn(50000)*1000))
    println("Bubble sort ", @time bubble_sort!((copy(v)))[2])
    println("Calc sort ", @time calc_sort!((copy(v)))[2])
    println("Comb sort ", @time comb_sort!((copy(v)))[2])
    println("Shell sort ", @time shell_sort!((copy(v)))[2])
    println("Merge sort ", @time merge_sort!((copy(v)))[2])
    println("Heap sort ", @time heap_sort!((copy(v)))[2])
    println("Quick sort ", @time quick_sort!((copy(v)))[2])
    println("Sort ", @time sort!((copy(v)))[2])

    println()
    println("Second test on an array with 500 000 elements")
    v = Int.(round.(rand(500000)*10000))
    println("Calc sort ", @time calc_sort!((copy(v)))[2])
    println("Comb sort ", @time comb_sort!((copy(v)))[2])
    println("Shell sort ", @time shell_sort!((copy(v)))[2])
    println("Merge sort ", @time merge_sort!((copy(v)))[2])
    println("Heap sort ", @time heap_sort!((copy(v)))[2])
    println("Quick sort ", @time quick_sort!((copy(v)))[2])
    println("Sort ", @time sort!((copy(v)))[2])

    println()
    println("Third test on an array with 4 000 000 elements")
    v = Int.(round.(rand(4000000)*100000))
    println("Calc sort ", @time calc_sort!((copy(v)))[2])
    println("Comb sort ", @time comb_sort!((copy(v)))[2])
    println("Shell sort ", @time shell_sort!((copy(v)))[2])
    println("Merge sort ", @time merge_sort!((copy(v)))[2])
    println("Heap sort ", @time heap_sort!((copy(v)))[2])
    println("Quick sort ", @time quick_sort!((copy(v)))[2])
    println("Sort ", @time sort!((copy(v)))[2])

    println()
    println("Third test on an array with 20 000 000 elements")
    v = Int.(round.(rand(20000000)*100000))
    println("Calc sort ", @time calc_sort!((copy(v)))[2])
    println("Comb sort ", @time comb_sort!((copy(v)))[2])
    println("Shell sort ", @time shell_sort!((copy(v)))[2])
    println("Merge sort ", @time merge_sort!((copy(v)))[2])
    println("Heap sort ", @time heap_sort!((copy(v)))[2])
    println("Quick sort ", @time quick_sort!((copy(v)))[2])
    println("Sort ", @time sort!((copy(v)))[2])
    
    println()
    println("Fifth test on an array with 100 000 000 elements")
    v = Int.(round.(rand(100000000)*100000))
    println("Calc sort ", @time calc_sort!((copy(v)))[2])
    println("Comb sort ", @time comb_sort!((copy(v)))[2])
    println("Shell sort ", @time shell_sort!((copy(v)))[2])
    println("Merge sort ", @time merge_sort!((copy(v)))[2])
    println("Heap sort ", @time heap_sort!((copy(v)))[2])
    println("Quick sort ", @time quick_sort!((copy(v)))[2])
    println("Sort ", @time sort!((copy(v)))[2])
    
    println()
    println("Sixth test on an array with 50 000 000 elements with 100 000 000 diferent elements")
    v = Int.(round.(rand(50000000)*100000000))
    println("Calc sort ", @time calc_sort!((copy(v)))[2])
    println("Comb sort ", @time comb_sort!((copy(v)))[2])
    println("Shell sort ", @time shell_sort!((copy(v)))[2])
    println("Merge sort ", @time merge_sort!((copy(v)))[2])
    println("Heap sort ", @time heap_sort!((copy(v)))[2])
    println("Quick sort ", @time quick_sort!((copy(v)))[2])
    println("Sort ", @time sort!((copy(v)))[2])

end

#= 
First test on an array with 50 000 elements
Bubble sort (value = -3930, time = 3.8369804, bytes = 400048, gctime = 0.0, gcstats = Base.GC_Diff(400048, 1, 0, 1, 0, 0, 0, 0, 0))
  0.000433 seconds (4 allocations: 460.344 KiB)
Calc sort -3930
  0.004908 seconds (4 allocations: 781.344 KiB)
Comb sort -3930
  0.007760 seconds (4 allocations: 781.344 KiB)
Shell sort -3930
  0.007761 seconds (4 allocations: 781.344 KiB)
Merge sort -3930
  0.002520 seconds (2 allocations: 390.672 KiB)
Heap sort -3930
  0.005381 seconds (2 allocations: 390.672 KiB)
Quick sort -3930
  0.001138 seconds (4 allocations: 460.344 KiB)
Sort -3930

Second test on an array with 500 000 elements
  0.002962 seconds (4 allocations: 3.891 MiB)
Calc sort 0
  0.055550 seconds (4 allocations: 7.629 MiB)
Comb sort 0
  0.098917 seconds (4 allocations: 7.629 MiB)
Shell sort 0
  0.106074 seconds (4 allocations: 7.629 MiB, 15.37% gc time)
Merge sort 0
  0.023150 seconds (2 allocations: 3.815 MiB)
Heap sort 0
  0.038229 seconds (2 allocations: 3.815 MiB)
Quick sort 0
  0.004135 seconds (4 allocations: 3.891 MiB)
Sort 0

Third test on an array with 4 000 000 elements
  0.033253 seconds (4 allocations: 31.281 MiB, 12.04% gc time)
Calc sort 0
  0.524320 seconds (4 allocations: 61.035 MiB, 1.27% gc time)
Comb sort 0
  1.234080 seconds (4 allocations: 61.035 MiB, 0.66% gc time)
Shell sort 0
  0.768506 seconds (4 allocations: 61.035 MiB, 0.78% gc time)
Merge sort 0
  0.194853 seconds (2 allocations: 30.518 MiB)
Heap sort 0
  0.393393 seconds (2 allocations: 30.518 MiB, 1.88% gc time)
Quick sort 0
  0.032719 seconds (4 allocations: 31.281 MiB)
Sort 0

Third test on an array with 20 000 000 elements
  0.161261 seconds (4 allocations: 153.351 MiB, 0.27% gc time)
Calc sort 0
  2.859901 seconds (4 allocations: 305.176 MiB, 1.08% gc time)
Comb sort 0
  9.466003 seconds (4 allocations: 305.176 MiB, 0.32% gc time)
Shell sort 0
  4.567135 seconds (4 allocations: 305.176 MiB, 0.95% gc time)
Merge sort 0
  1.074089 seconds (2 allocations: 152.588 MiB, 1.66% gc time)
Heap sort 0
  2.169511 seconds (2 allocations: 152.588 MiB, 0.95% gc time)
Quick sort 0
  0.173799 seconds (4 allocations: 153.351 MiB, 9.50% gc time)
Sort 0

Fifth test on an array with 100 000 000 elements
  2.885258 seconds (4 allocations: 763.703 MiB, 0.30% gc time)
Calc sort 0
 16.720587 seconds (4 allocations: 1.490 GiB, 1.17% gc time)
Comb sort 0
 55.055246 seconds (4 allocations: 1.490 GiB, 0.26% gc time)
Shell sort 0
 22.484435 seconds (4 allocations: 1.490 GiB, 0.61% gc time)
Merge sort 0
  5.904219 seconds (2 allocations: 762.939 MiB, 1.25% gc time)
Heap sort 0
  9.587958 seconds (2 allocations: 762.939 MiB, 0.73% gc time)
Quick sort 0
  0.811172 seconds (4 allocations: 763.703 MiB, 8.82% gc time)
Sort 0

Sixth test on an array with 50 000 000 elements with 100 000 000 diferent elements
  3.073662 seconds (4 allocations: 1.118 GiB, 1.14% gc time)
Calc sort 3
  9.262040 seconds (4 allocations: 762.940 MiB, 1.18% gc time)
Comb sort 3
 31.846659 seconds (4 allocations: 762.940 MiB, 0.24% gc time)
Shell sort 3
 12.244233 seconds (4 allocations: 762.940 MiB, 0.66% gc time)
Merge sort 3
  3.534400 seconds (2 allocations: 381.470 MiB, 1.21% gc time)
Heap sort 3
  9.958510 seconds (2 allocations: 381.470 MiB, 0.43% gc time)
Quick sort 3
  1.923533 seconds (5 allocations: 762.944 MiB, 4.06% gc time)
Sort 3
=#



function test_matrix()
    M = round.(rand(5000,5000)*10000, digits = 3)
    print("First way")
    @time sort_matrix_1!(copy(M))
    print("Second way")
    @time sort_matrix_2!(copy(M))
end

#= 
First way  0.717790 seconds (20.01 k allocations: 763.512 MiB, 6.17% gc time)
Second way  8.372860 seconds (341.04 k allocations: 6.388 GiB, 45.76% gc time)
=#