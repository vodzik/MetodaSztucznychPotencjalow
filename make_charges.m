function [ charges ] = make_charges( density, obstacles)

size_of_obstacles=size(obstacles);

number_of_obstacles=size_of_obstacles(1)
charges=0;
caunter=0;
for i=1:number_of_obstacles
    
    k=1;
    if(obstacles(i,1)>obstacles(i,3)) k=-1;
    end
    l=1;
    if(obstacles(i,2)>obstacles(i,4)) l=-1;
    end
        
    for j=obstacles(i,1):k/density:obstacles(i,3)
        caunter=caunter+1;
        charges(caunter,1)=j;
        charges(caunter,2)=obstacles(i,2);
        caunter=caunter+1;
        charges(caunter,1)=j;
        charges(caunter,2)=obstacles(i,4);
    end
        
    for j=obstacles(i,2):l/density:obstacles(i,4)
        caunter=caunter+1;
        charges(caunter,1)=obstacles(i,1);
        charges(caunter,2)=j;
        
        caunter=caunter+1;
       
        charges(caunter,1)=obstacles(i,3);
         charges(caunter,2)=j;
    end
    
    
end



end

