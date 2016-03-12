function [ potential ] = field( x,y,charges )

potential=0;

number_of_charges=size(charges);
number_of_charges=number_of_charges(1);

for i=1:number_of_charges
   potential=potential+repulsion(sqrt((charges(i,1)-x)^2+(charges(i,2)-y)^2)); 
end

end

