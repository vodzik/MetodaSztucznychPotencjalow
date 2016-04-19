function [px, py] = grad(current_pos,delta,charges,target)

% funkcja wyliczajaca gradient z macierzy wartoœci potencja³ów

px = -(field(current_pos(1,1)+delta,current_pos(1,2),charges,target)-field(current_pos(1,1),current_pos(1,2),charges,target))/delta;
py = -(field(current_pos(1,1),current_pos(1,2)+delta,charges,target)-field(current_pos(1,1),current_pos(1,2),charges,target))/delta;

% move_rob(current_pos,px,py);

end

