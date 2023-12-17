using HorizonSideRobots
r = Robot("untitled.sit", animate = true)

function final!(stc, rob, side)
    while !stc()
        move!(rob, side)
        final!(stc, rob, side)
    end
end

final!(() -> isborder(r, Sud), r, Sud)