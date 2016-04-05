clear all;
close all;

density=5;             %ilo�� punkt�w �adunku na jednostk� odleg�o�ci

obstacles = [10,10,15,15;  
            -10,-10,-15,-15;
            -5,-5,5,5];
        %macie� przeszk�d. Kolejne linie definiuj� kolejne przeszkody
        %opisuj�c wsp�rz�dne przeciwleg�ych wierzcho�k�w [x1,y1,x2,y2]
        
target = [10,-10]; 
        %wsp�rz�dne [x,y] celu
        

         
charges=make_charges(density,obstacles) 
        %tworzenie macierzy �adunk�w. Kolejne wiersze opisuja wsp�rz�dne 
        %kolejnych �adunk�w 

% figure
% plot(charges(:,1),charges(:,2),'.')
% hold on;
% plot(target(:,1),target(:,2),'.r')
        %wizualizacja rozmieszczenia �adunk�w i celu


grid_resolution= 50; %rozdzielczo�� wizualizacji pola potencja��w

xmin = -15;
xmax = 15;

ymin = -15;
ymax = 15;
%rozpi�to�� wizualizacji

zmax = 200; %maksymalna warto�� potencja�u
zmin = -20 % minimalna warto�� potencja�u


% przygotowanie osi wykresu 3d

x(1)=xmin;
y(1)=ymin;

for i=1:grid_resolution;
   x(i+1)=(((xmax-xmin)*(i))/grid_resolution)+xmin;
end

for i=1:grid_resolution+1;
   x(i,:)=x(1,:);
end

for i=1:grid_resolution;
   y(i+1)=(((ymax-ymin)*(i))/grid_resolution)+ymin;
end

for i=1:grid_resolution+1;
   y(i,:)=y(1,:);
end
y=y';


% opbiczanie potencja��w na dla wykresu
for i=1:grid_resolution+1
   for j=1:grid_resolution+1;
       
    z(i,j)=field(x(i,j),y(i,j),charges,target);
    
    if z(i,j)>zmax
       z(i,j)=zmax; 
    end
    
      if z(i,j)<zmin
       z(i,j)=zmin; 
    end
end
end

%wizualizacja potencja��w 3d
figure;
surf(x,y,z);

delta=0.05;
move_delta=0.5;
current_pos = [-15,15]; 
goal=0;
goal_delta = 0.1;
figure
plot(charges(:,1),charges(:,2),'.')
xlabel('x');
ylabel('y');
hold on;
plot(target(:,1),target(:,2),'.r')
plot(current_pos(:,1),current_pos(:,2),'.g');
pause(0.1)

while goal==0
    [px,py]=grad(current_pos,delta,charges,target)
    current_pos = move_rob(current_pos,px,py,move_delta)
    goal = if_goal(current_pos,target,goal_delta)
    plot(current_pos(:,1),current_pos(:,2),'.g');
    pause(0.1)
end

% testy

[px,py] = gradient(z);
px=-px;
py=-py;
scale=5;
figure
plot(charges(:,1),charges(:,2),'.')
xlabel('x');
ylabel('y');
hold on;
plot(target(:,1),target(:,2),'.r')
quiver(x,y,px,py,scale);
% 
% px=-px;
% % figure;
% % surf(x,y,px);
% py=-py;
% % figure;
% % surf(x,y,py);
% 
% P=sqrt(px.^2 + py.^2);
% figure;
% surf(x,y,P);