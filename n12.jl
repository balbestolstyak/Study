using HorizonSideRobots
r = Robot("untitled.sit", animate=true) 

function peregorodki_count!(rob)
    g, v = to_wall!(rob, West), to_wall!(rob, Sud)
    if ! isborder(rob, Nord)
        move!(rob, Nord)
    else
        return 0
    end
    m = gomove!(rob)
    to_wall!(rob, West)
    to_wall!(rob, Sud)
    nmove!(rob, Nord, v)
    nmove!(rob, Ost, g)
    return m
end

function nmove!(rob, side, n)
    for i in 1:n
        move!(rob, side)
    end
end

function gomove!(rob)
    n = 0
    s = Ost
    while !isborder(rob,Nord)
        x = walls!(rob, s)
        move!(rob, Nord)
        s = inverse(s)
        n += x
    end
    n += walls!(rob, s)
    return n
end

function walls!(rob, s)
    x = 0
    g = 0
    f = 0
    n = 0
    while ! isborder(r, s)
        n = g
        g = f
        if isborder(r, Sud)
            f = 1
        else
            f = 0
        end
        if  (f == 0) & (g == 0)
            x += n  
        end
        move!(r, s)
    end
    if (f == 1) || (g == 1)
        x += 1
    end
    println(x)
    return x
end

function inverse(s)
    return HorizonSide(mod(Int(s) + 2,4))
end

function to_wall!(rob, side)
    n = 0
    while ! isborder(rob, side)
        move!(rob, side)
        n += 1
    end
    return n
end

print(peregorodki_count!(r))