function [goal] = if_goal(current_pos, target, goal_delta)
 
% czy robot osiagnal cel
if abs(current_pos(1,1)-target(1,1)) < goal_delta && abs(current_pos(1,2)-target(1,2)) < goal_delta
    goal=1;
else
    goal=0;
end

