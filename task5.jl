v = Int.(round.(randn(50000)*1000))

function bubble_sort!(a)
    n = length(a)
    for k in 1:n-1
        istranspose = false
        for i in 1:n-k
            if a[i] > a[i+1]
                a[i], a[i+1] = a[i+1], a[i]
                istranspose = true
            end
        end
        if istranspose == false
            break
        end
    end
    return a
end
    
function calc_sort!(A::AbstractVector{<:Integer})
    min_val, max_val = extrema(A)
    num_val = zeros(Int, max_val-min_val+1)
    for val in A
        num_val[val-min_val+1] += 1
    end
    k = 0
    for (i, num) in enumerate(num_val)
        A[k+1:k+num] .= min_val+i-1
        k += num
    end
    return A
end


function comb_sort!(a::AbstractVector; factor=1.2473309)
    a = copy(a)
    step = length(a)
    while step >= 1
        for i in 1:length(a)-step
            if a[i] > a[i+step]
                a[i], a[i+step] = a[i+step], a[i]
            end
        end
        step = Int(floor(step/factor))
    end
    a = bubble_sort!(a)
    return a
end


function shell_sort!(a::AbstractVector)
    a = copy(a)
    n=length(a)
    step_series = (n÷2^i for i in 1:Int(floor(log2(n))))
    for step in step_series
        for i in firstindex(a):lastindex(a)-step
            j = i
            while j >= firstindex(a) && a[j] > a[j+step]
                a[j], a[j+step] = a[j+step], a[j]
                j -= step
            end
        end
    end
    return a
end
    
@inline
function Base.merge!(a1, a2, a3)::Nothing
    i1, i2, i3 = 1, 1, 1
    @inbounds begin
        while i1 <= length(a1) && i2 <= length(a2)
            if a1[i1] < a2[i2]
                a3[i3] = a1[i1]
                i1 += 1
            else
                a3[i3] = a2[i2]
                i2 += 1
            end
            i3 += 1
        end
    end
    
    @inbounds begin
        if i1 > length(a1)
            a3[i3:end] .= @view(a2[i2:end])
        else
            a3[i3:end] .= @view(a1[i1:end])
        end
    end
    nothing
end


function merge_sort!(a)
    b = similar(a)
    N = length(a)
    n = 1
    @inbounds begin
        while n < N
            K = div(N, 2n) 
            for k in 0:K-1
                merge!(@view(a[(1:n).+k * 2n]), @view(a[(n+1:2n).+k * 2n]), @view(b[(1:2n).+k * 2n]))
            end
            if N - K * 2n > n
                merge!(@view(a[(1:n).+K * 2n]), @view(a[K * 2n+n+1:end]), @view(b[K * 2n+1:end]))
            elseif 0 < N - K * 2n <= n
                b[K * 2n+1:end] .= @view(a[K * 2n+1:end])
            end
            a, b = b, a
            n  *= 2
        end
    end
    if isodd(log2(n))
        b .= a
        a = b
    end
    return a
end



function heap!(array)
    N = length(array)
    for i in 1:N÷2
        if array[i] < array[2i]
            array[i], array[2i] = array[2i], array[i]
        end
        if 2i+1 <= N && array[i] < array[2i+1]
        array[i], array[2i+1] = array[2i+1], array[i]
        end
    end
    return array
end

function down_first!(heap::AbstractVector)::Nothing
    index = 1
    N = length(heap)
    while index < N÷2
        if heap[index] < heap[2index]
            heap[index], heap[2index] = heap[2index], heap[index]
        end
        if 2index+1 <= N && heap[index] < heap[2index+1]
            heap[index], heap[2index+1] = heap[2index+1],heap[index]
        end
        index *= 2
    end
end

function heap_sort!(heap::AbstractVector)
    heap = heap!(heap)
    N = length(heap)
    while N > 3
        heap[1], heap[N] = heap[N], heap[1]
        N -= 1
        down_first!(@view(heap[1:N]))
    end
    return heap
end



function part_sort!(A, b)
    N = length(A)
    K=0; L=0; M=N
    #ИНВАРИАНТ: A[1:K] < b && A[K+1:L] == b && A[M+1:N] > b
    while L < M
        if A[L+1] == b
            L += 1
        elseif A[L+1] > b
            A[L+1], A[M] = A[M], A[L+1]
            M -= 1
        else # if A[L+1] < b
            L += 1; K += 1
            A[L], A[K] = A[K], A[L]
        end
    end
    return K, M+1
end


function quick_sort!(A)
    if isempty(A)
        return A
    end
    N = length(A)
    K, M = part_sort!(A, A[rand(1:N)])
    quick_sort!(@view(A[1:K]))
    quick_sort!(@view(A[M:N]))
    return A
end


function order_statistics!(A::AbstractVector{T},i::Integer)::T where T
    function part_sort!(indexes_range::AbstractUnitRange, b)
    K = indexes_range[begin]-1
    L = indexes_range[begin]-1 
    M = indexes_range[end]

    while L < M
        if A[L+1] == b
            L += 1
        elseif A[L+1] > b
            A[L+1], A[M] = A[M], A[L+1]
            M -= 1
        else 
            L += 1; K += 1
            A[L], A[K] = A[K], A[L]
        end
    end
    return indexes_range[begin]:K, M+1:indexes_range[end]
end

function find(indexes_range)
    left_range, right_range = part_sort!(indexes_range, A[rand(indexes_range)])
        if i in left_range
            return find(left_range)
        elseif i in right_range
            return find(right_range)
        else
            return A[i]
        end
    end
    find(firstindex(A):lastindex(A))
end

order_statistics(A, i) = order_statistics!(copy(A), i)

function median(A)
    if isodd(length(A))
        return order_statistics(A, length(A)÷2+1)
    end
    return (order_statistics(A, length(A)÷2)+order_statistics(A, length(A)÷2+1))/2
end


function BinSearch(arr, el;left =1, right = length(arr))
    while left <=right
        middle = (right+left)÷2
        if (arr[middle] == el) return middle end
        if (arr[middle] < el) left = middle + 1 end
        if (arr[middle] > el) right = middle - 1 end
    end
end




mean(v::AbstractVector) = sum(v)/length(v) 

function sko(v::AbstractVector)
    m = mean(v)
    return sqrt(sum([(m-i)^2 for i in v])/(length(v)-1))
end



function welford_std(data)
    n = 0
    mean = 0.0
    M2 = 0.0
    
    for x in data
        n += 1
        delta = x - mean
        mean += delta / n
        delta2 = x - mean
        M2 += delta * delta2
    end
    
    if n < 2
        return NaN
    else
        variance = M2 / (n - 1)
        return sqrt(variance)
    end
end

function test_sko()
    v = randn(300_000_000)
    @time sko(v)
    @time welford_std(v)
end

#=

sko
39.005544 seconds (65.75 k allocations: 2.240 GiB, 0.05% gc time, 0.29% compilation time)

welford_std
26.747950 seconds (3.77 k allocations: 252.032 KiB, 0.26% compilation time)

=#

M = Int.(round.(10000*randn(5000,5000)))

function sort_matrix_1!(M::AbstractMatrix)
    v = [welford_std(M[:,i]) for i in 1:size(M,2)]
    return M[:,sortperm(v)]
end

function sort_matrix_2!(M::AbstractMatrix)
    v = [M[:, i] for i in 1:size(M, 2)]
    sort!(v, by = welford_std)
    M = hcat(v...)
    return M
end

#= 

@time sort_matrix_1!(copy(M))
0.741299 seconds (10.01 k allocations: 572.548 MiB, 10.78% gc time)

@time sort_matrix_2!(copy(M))
10.922085 seconds (334.37 k allocations: 6.264 GiB, 38.55% gc time)

=#