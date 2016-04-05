function [ potential ] = field( x,y,charges,target)

%funkcja wylicza warto�� potencja�u w punkcie "x","y" d�a �adunk�w
%odpychaj�cych "charges" i celu "target".
Q=5;
ni=2;
potential=0;  %wartosc potencja�u (na pocz�tku r�wna 0)

number_of_charges=size(charges);
number_of_charges=number_of_charges(1);  %number_of_charges okre�la ilo�� �adunk�w na scenie

potential=potential+attraction(sqrt((target(1,1)-x)^2+(target(1,2)-y)^2)); % dodanie potencja�u pochodzacego od celu

for i=1:number_of_charges    
    if sqrt((charges(i,1)-x)^2+(charges(i,2)-y)^2) <= Q
        potential=potential+0.5*ni*(repulsion(sqrt((charges(i,1)-x)^2+(charges(i,2)-y)^2))-repulsion(Q))^2; %dodawanie potencja��w z kolejnych �adunk�w
    end
end

end

