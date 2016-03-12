clear all;
close all;

density=5;             %iloœæ punktów ³adunku na jednostkê odleg³oœci

obstacles = [10,10,15,15;  
            -10,-10,-15,-15];
        %macie¿ przeszkód. Kolejne linie definiuj¹ kolejne przeszkody
        %opisuj¹c wspó³rzêdne przeciwleg³ych wierzcho³ków [x1,y1,x2,y2]
         
         
charges=make_charges(density,obstacles) 
        %tworzenie macierzy ³adunków. Kolejne wiersze opisuja wspó³rzêdne 
        %kolejnych ³adunków 

figure
plot(charges(:,1),charges(:,2),'.')
        %wizualizacja rozmieszczenia ³adunków


grid_resolution= 200; %rozdzielczoœæ wizualizacji pola potencja³ów

xmin = -20;
xmax = 20;

ymin = -20;
ymax = 20;
%rozpiêtoœæ wizualizacji

zmax = 55; %maksymalna wartoœæ potencja³u





% przygotowanie osi wykresu 3d
for i=1:grid_resolution;
   x(i)=(((xmax-xmin)*i)/grid_resolution)+xmin;
end

for i=1:grid_resolution;
   x(i,:)=x(1,:);
end

for i=1:grid_resolution;
   y(i)=(((ymax-ymin)*i)/grid_resolution)+ymin;
end

for i=1:grid_resolution;
   y(i,:)=y(1,:);
end
y=y';


% opbiczanie potencja³ów na dla wykresu
for i=1:grid_resolution
   for j=1:grid_resolution;
       i
    z(i,j)=field(x(i,j),y(i,j),charges);
    
    if z(i,j)>zmax
       z(i,j)=zmax; 
    end
end
end

%wizualizacja potencja³ów 3d
figure
surf(x,y,z);

