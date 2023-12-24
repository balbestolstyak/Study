include("librobot.jl")

mutable struct ChessRobotN <: AbstractRobot
    robot::Robot
    coordinates::Coordinates
    state::Bool
    ChessRobotN(r, state) = new(r, Coordinates(0, 0), state) # координаты изначально 0, 0
end

function HSR.move!(robot::ChessRobotN, side)
    state = get_state(robot)
    if state
        putmarker!(robot)
    end 
    move!(get_baserobot(robot), side)
    robot.state = !state
    move!(robot.coordinates,side)
end

get_state(robot::ChessRobotN) = robot.state

along!(robot,side) = along!(()->false,robot,side)


function go_back(robot::AbstractRobot) 
    x,y = get(robot.coordinates)
    for _ in 1:x
        move!(robot,West)
    end
    for _ in 1:y
        move!(robot,Sud)
    end
end 

function chess_mark!(robot)
    along!(robot,West)
    along!(robot,Sud)
    snake!(robot,Ost,Nord)
    putmarker!(robot)
    go_back(robot)
end


r = ChessRobotN(Robot("task_13.sit"),true)

HSR.show!(robot::AbstractRobot) = show!(get_baserobot(robot))

chess_mark!(r)

show!(r)




