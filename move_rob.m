function [current_pos] = move_rob(current_pos,px,py,move_delta)

% funkcja ruchu wed³ug obliczonego gradientu pola potencja³ów
current_pos(1,1) = current_pos(1,1) + move_delta*px/sqrt(px^2 + py^2);
current_pos(1,2) = current_pos(1,2) + move_delta*py/sqrt(px^2 + py^2);

end

