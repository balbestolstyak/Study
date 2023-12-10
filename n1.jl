using HorizonSideRobots

rob = Robot("map.sit", animate=true)

function plus_krest!(rob)
    for s in [Nord, Ost, Sud, West]
        while isborder(rob, s) == 0
            move!(rob, s)
            putmarker!(rob)
        end
        s = HorizonSide(mod(Int(s) + 2 , 4))
        while ismarker(rob) == 1
            move!(rob, s)
        end
    end
    putmarker!(rob)
end

plus_krest!(rob)