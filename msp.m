clear all;
close all;

density=5;             %ilo�� punkt�w �adunku na jednostk� odleg�o�ci

obstacles = [10,10,15,15;  
            -10,-10,-15,-15];
        %macie� przeszk�d. Kolejne linie definiuj� kolejne przeszkody
        %opisuj�c wsp�rz�dne przeciwleg�ych wierzcho�k�w [x1,y1,x2,y2]
         
         
charges=make_charges(density,obstacles) 
        %tworzenie macierzy �adunk�w. Kolejne wiersze opisuja wsp�rz�dne 
        %kolejnych �adunk�w 

figure
plot(charges(:,1),charges(:,2),'.')
        %wizualizacja rozmieszczenia �adunk�w


grid_resolution= 200; %rozdzielczo�� wizualizacji pola potencja��w

xmin = -20;
xmax = 20;

ymin = -20;
ymax = 20;
%rozpi�to�� wizualizacji

zmax = 55; %maksymalna warto�� potencja�u





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


% opbiczanie potencja��w na dla wykresu
for i=1:grid_resolution
   for j=1:grid_resolution;
       i
    z(i,j)=field(x(i,j),y(i,j),charges);
    
    if z(i,j)>zmax
       z(i,j)=zmax; 
    end
end
end

%wizualizacja potencja��w 3d
figure
surf(x,y,z);

