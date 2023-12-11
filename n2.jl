using HorizonSideRobots
r = Robot("map2.sit", animate=true)

function gomove!(rob, side, n)
    for i in 1:n
        move!(rob, side)
    end
end

function per_i_obr!(robot)
    vertik, goriz = v_ugol!(robot, Nord, Ost)
    per!(robot)
    gomove!(robot, Sud, vertik)
    gomove!(robot, West, goriz)
end

function v_ugol!(rob, side1, side2)
    n1, n2 =  0, 0
    while ! isborder(rob, side2)
        move!(rob, side2)
        n2 += 1
    end
    while ! isborder(rob, side1)
        move!(rob, side1)
        n1 += 1
    end
    return n1, n2
end

function per!(robot)
    for i in [West, Sud, Ost, Nord]
        while isborder(r, i) == false
            move!(r, i)
            putmarker!(r)
        end
    end
end

per_i_obr!(r)