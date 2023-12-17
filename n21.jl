using HorizonSideRobots
r = Robot("untitled.sit", animate = true) 

function through(r::Robot, side::HorizonSide, steps::Int = 0)
    t = ortpov(side)
    if not_wall!(r, side)
        move!(r, inverse(t), steps)
    else
        if isborder(r, side)
            move!(r, t)
            steps += 1
            x = through(r, side, steps)
            steps += x
            return steps
        end
    end
    return 0
end

function not_wall!(r, side)
    if !isborder(r, side) 
        move!(r, side)
        return true
    else 
        return false
    end
end

function HorizonSideRobots.move!(r::Robot, s::HorizonSide, num::Integer)
    for n in 1:num
        move!(r, s)
    end
end

function inverse(s)
    return HorizonSide(mod(Int(s) + 2, 4))
end

function ortpov(s)
    return HorizonSide(mod(Int(s) + 1, 4))
end

through(r, Sud)