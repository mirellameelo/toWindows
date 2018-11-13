% REFERENTE A M_H_01
clear all;
traj = 'trajectory.txt';
traj_GT = 'data.csv';

%_____________________IMPORTING DATA______________________
xyz = importdata(traj,',', 0);
xyz_GT = importdata(traj_GT,',', 1);
xyz_GT = xyz_GT.data;

%importando apenas x_GT de xyz_GT
x_GT = xyz_GT( : ,2);
x_sub = xyz_GT( 1 , 2);
%colocando na origem
x_GT = x_GT - x_sub;

y_GT = xyz_GT( : ,3);
y_sub = xyz_GT( 1 , 3);
y_GT = y_GT - y_sub;

z_GT = xyz_GT( : ,4);
z_sub = xyz_GT( 1 , 4);
z_GT = z_GT - z_sub;

x = xyz( : , 1);
y = xyz( : , 2);
z = xyz( : , 3);

%__________________________________________________%
%step = numero de variáveis de x_GT dividido pelo numero de variáveis de x
%siize = numero de variáveis de x/y/z

step = size(x_GT)/size(x);
[sz1,sz2] = size(x);
siize = sz1;

x_GT_2 = zeros(siize, 1);
y_GT_2 = zeros(siize, 1);
z_GT_2 = zeros(siize, 1);

%primeiro com primeiro
x_GT_2(1, 1) = x_GT(1, 1);
y_GT_2(1, 1) = y_GT(1, 1);
z_GT_2(1, 1) = z_GT(1, 1);

varr = 0;
for i = 2:siize
    varr = varr + step;
    var = round(varr + step);
    x_GT_2(i, 1) = x_GT(var, 1);
    y_GT_2(i, 1) = y_GT(var, 1);
    z_GT_2(i, 1) = z_GT(var, 1);
end

%__________________________ERRO___________________________%
position(:, 1) = x(:, 1);
position(:, 2) = y(:, 1);
position(:, 3) = z(:, 1);

position_GT(:, 1) = x_GT_2(:, 1);
position_GT(:, 2) = y_GT_2(:, 1);
position_GT(:, 3) = z_GT_2(:, 1);

err = immse(position, position_GT);

%__________________________PLOTING___________________________%
Figure3 = scatter3(x, y, z, 'm');
hold on;
Figure4 = scatter3(x_GT_2, y_GT_2, z_GT_2, 'b');
Figure3.SizeData = 5;
Figure4.SizeData = 5;
title('Trajectory')
xlabel('x [m]')
ylabel('y [m]')
zlabel('z [m]')
legend([Figure3 Figure4],{'OKVIS','GT'})

for i = 1:15:siize
    plot3([x(i) x_GT_2(i)], [y(i) y_GT_2(i)], [z(i) z_GT_2(i)]);
end 

clear xyz_GT;
clear traj;
clear traj_GT;
clear xyz;
clear z_sub
clear y_sub
clear x_sub
