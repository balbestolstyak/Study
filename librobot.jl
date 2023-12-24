using HorizonSideRobots
HSR = HorizonSideRobots

left(side::HorizonSide) = HorizonSide(mod(Int(side)+1, 4))
right(side::HorizonSide) = HorizonSide(mod(Int(side)-1, 4))
inverse(side::HorizonSide) = HorizonSide(mod(Int(side)+2, 4))

try_move!(robot, side) = 
    if isborder(robot, side)
        return false
    else
        move!(robot, side)
        return true
    end


# Обобщенные функции, функции высшего порядка:

along!(stop_condition::Function, robot, side) = 
    while stop_condition() == false && try_move!(robot, side) end
 
function numsteps_along!(stop_condition::Function, robot, side)
    n = 0
    while stop_condition() == false && try_move!(robot, side)
        n += 1
    end
    return n
end

function snake!(stop_condition::Function, robot, start_side = Ost, ortogonal_side = Nord)
    print("++")
    s = start_side
    along!(stop_condition, robot, s)
    while !stop_condition() && !isborder(robot, ortogonal_side) # && try_move!(robot, ortogonal_side) - так будет лишняя попытка обхода внешней рамки
        move!(robot, ortogonal_side)
        s = inverse(s)
        along!(stop_condition, robot, s)
    end
end

snake!(robot, start_side, ortogonal_side) = snake!(() -> false, robot; start_side, ortogonal_side)

function move_num!(stop_condidion::Function, robot, side, num)
    for x in 1:num
        if !stop_condidion()
            move!(robot, side)
        else
            return false
        end
    end
    return !stop_condidion()
end

function shuttle!(stop_condition::Function, robot; start_side)
    s = start_side
    n = 0
    while stop_condition() == false
        n += 1
        move_num!(()->stop_condition(), robot, s, n)
        s = inverse(s)
    end
    return (n+1)÷2 # - число шагов от начального положения до конечного
end

function spiral!(stop_condition::Function, robot; start_side = Nord, nextside::Function = left)
    side = start_side
    n = 0
    while stop_condition() == false
        n += 1
        move!(()->stop_condition(), robot, side; num_maxsteps = n)
        side = nextside(side)
        move!(()->stop_condition(), robot, side; num_maxsteps = n)
        side = nextside(side)
    end
end
          
function HSR.move!(stop_condition::Function, robot, side; num_maxsteps::Integer)
    n = 0
    while n < num_maxsteps && stop_condition() == false
        n += 1
        move!(robot, side)
    end
    return n
end

HSR.move!(robot, side, num_steps::Integer) =
    for _ ∈ 1:num_steps
        move!(robot, side)
    end

#-------------- Конкретный пользовательский тип данных

mutable struct Coordinates
    x::Int
    y::Int
end

function HSR.move!(coord::Coordinates, side::HorizonSide)
    if side == Ost
        coord.x += 1
    elseif side == West
        coord.x -= 1
    elseif side == Nord
        coord.y += 1
    else # side == Sud
        coord.y -= 1
    end
    nothing
end

get(coord::Coordinates) = (coord.x, coord.y)

#-------------------------------------
# к занятию 8:

abstract type AbstractRobot end

get_baserobot(robot::AbstractRobot) = robot.robot
HSR.move!(robot::AbstractRobot, side) = move!(get_baserobot(robot), side)
HSR.isborder(robot::AbstractRobot, side) = isborder(get_baserobot(robot), side)
HSR.putmarker!(robot::AbstractRobot) = putmarker!(get_baserobot(robot))
HSR.ismarker(robot::AbstractRobot) = ismarker(get_baserobot(robot))
HSR.temperature(robot::AbstractRobot) = temperature(get_baserobot(robot))

#----------------------------------------