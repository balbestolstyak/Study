using HorizonSideRobots
rob = Robot("untitled.sit", animate = true)

function shuttle!(t, r)
    n = 1
    s = Ost
    while !t()
        gomove!(t, r, s, n)
        n += 1
        s = inverse(s)
    end
end

function inverse(s)
    return HorizonSide(mod(Int(s) + 2, 4))
end

function gomove!(t, r, side, n)
    for i in 1:n
        if !t()
            try_move!(t, r, side)
        end
    end
end

function try_move!(t, r, side)
    if !t()     
        move!(r, side)   
    end
end

shuttle!(() -> !isborder(rob, Nord), rob)