using HorizonSideRobots
r = Robot("untitled.sit", animate=true) 

function chess!(r)
    v, g = corner_put_count!(r, Sud, West)
    if mod(v, 2) == mod(g, 2)
        putmarker!(r)
    end
    snake!(() -> isborder(r, Nord),r, Ost, Nord)
    corner_put_count!(r, Sud, West)
    gomove!(r, Nord, v)
    gomove!(r, Ost, g)
end

function snake!(st_cond, r, tec, osn)
    while !st_cond()
        line!(() -> isborder(r, tec), r, tec)
        if ismarker(r)
            move!(r, osn)
        else
            move!(r, osn)
            putmarker!(r)
        end
        tec = inverse(tec)
    end
    line!(() -> isborder(r, tec), r, tec)
end

function line!(st_cond, r, s)
    if !ismarker(r)
        move!(r, s)
        putmarker!(r)
    else
        f = 1
    end
    f = 0
    while !st_cond()
        move!(r, s)
        f = gg!(r, f)
    end
end

function gg!(r, f)
    if f == 1
        putmarker!(r)
        f = 0
    else
        f = 1
    end
    return f
end

function corner_put_count!(r, side1, side2)
    n1 = numsteps_along!(() -> isborder(r, side1), r, side1)
    n2 = numsteps_along!(() -> isborder(r, side2), r, side2)
    return n1, n2
end

function numsteps_along!(st_cond, r, side)
    n = 0
    while !st_cond()
        move!(r, side)
        n += 1
    end
    return n
end

function inverse(s)
    return HorizonSide(mod(Int(s) + 2,4))
end

function gomove!(r, side, n)
    for i in 1:n
        move!(r, side)
    end
end

chess!(r)