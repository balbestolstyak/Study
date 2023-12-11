using HorizonSideRobots
r = Robot("untitled.sit", animate=true) 

function per_obr!(r)
    p = v_ugol!(r, Sud, West)
    per!(r)
    obr!(r, Nord, Ost, p)
end

function per!(r)
    for i in [Nord, Ost, Sud, West]
        while isborder(r, i) == false
            move!(r, i)
            putmarker!(r)
        end
    end
end

function v_ugol!(r, side1, side2)
    p = ""
    while !(isborder(r, side1) & isborder(r, side2))
        if ! isborder(r, side1)
            move!(r, side1)
            p = p * "0" 
        end    
        if ! isborder(r, side2)
            move!(r, side2) 
            p = p * "1"
        end  
    end 
    return p
end

function obr!(r, side1, side2, p::String)
    p = reverse(p)
    for i in p
        if i == '0'
            move!(r, side1)
        else
            move!(r, side2)
        end
    end
end

per_obr!(r)