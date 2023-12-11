using HorizonSideRobots
r = Robot("untitled.sit", animate=true)

function gomove!(rob, side, n)
    for i in 1:n
        move!(rob, side)
    end
end

function all_i_obr!(robot)
    vertik, goriz = v_ugol!(robot, Nord, Ost)
    all!(robot)
    gomove!(robot, Sud, vertik)
    gomove!(robot, West, goriz)
end

function all!(robot)
    s = Sud
    while isborder(robot, West) == 0
        putmarker!(robot)
        while isborder(robot, s) == 0
            move!(robot, s)
            putmarker!(robot)
        end
        s = HorizonSide(mod(Int(s) + 2 , 4))
        move!(robot, West)
    end
    putmarker!(robot)
    while isborder(robot, s) == 0
        move!(robot, s)
        putmarker!(robot)
    end
    for i in [Nord, Ost]
        while isborder(robot, i) == 0
            move!(robot, i)
        end
    end
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

all_i_obr!(r)