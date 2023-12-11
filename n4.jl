using HorizonSideRobots
rob = Robot("untitled.sit", animate=true)

function krest!(robot)
    for a in [Sud, Nord]
        for b in [West, Ost]
            while (isborder(robot, a) + isborder(robot, b)) == 0
                move!(robot, a)
                move!(robot, b)
                putmarker!(robot)
            end
            a = HorizonSide(mod(Int(a) + 2 , 4))
            b = HorizonSide(mod(Int(b) + 2 , 4))
            while ismarker(robot) == 1
                move!(robot, a)
                move!(robot, b)
            end
        end
    end
    putmarker!(robot)
end

krest!(rob)