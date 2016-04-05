function [ charges ] = make_charges( density, obstacles)

size_of_obstacles=size(obstacles);

number_of_obstacles=size_of_obstacles(1)
charges=0;
counter=0;
for i=1:number_of_obstacles
    
    k=1;
    if(obstacles(i,1)>obstacles(i,3)) k=-1;
    end
    l=1;
    if(obstacles(i,2)>obstacles(i,4)) l=-1;
    end
        
    for j=obstacles(i,1):k/density:obstacles(i,3)
        counter=counter+1;
        charges(counter,1)=j;
        charges(counter,2)=obstacles(i,2);
        counter=counter+1;
        charges(counter,1)=j;
        charges(counter,2)=obstacles(i,4);
    end
        
    for j=obstacles(i,2):l/density:obstacles(i,4)
        counter=counter+1;
        charges(counter,1)=obstacles(i,1);
        charges(counter,2)=j;
        
        counter=counter+1;
       
        charges(counter,1)=obstacles(i,3);
         charges(counter,2)=j;
    end
    
    
end



end

