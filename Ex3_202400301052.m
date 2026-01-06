%% ch6 题目1

clear;clc;clf;
x = -8:1:8;
y1 = 2*x + 1;
y2 = -2*x + 1;
hold on
plot(x, y1, '-b', x, y2, '--g', LineWidth=2)
com_x = x(y1==y2);
com_y = y1(y1==y2);
scatter(com_x, com_y, 400,'r', 'filled', 'pentagram')
hold off
title("y1和y2的关系", "FontSize",18)
legend('y_{1}', 'y_{2}', 'y_1和y_2的交点', 'fontsize', 14)

text(-4, -9, '\leftarrow y_1', FontSize=18)
text(-4, 11, "\leftarrow y_2", FontSize=18)

%% 题目2

clear;clc;
t = 0:0.01:20;
V0 = 100; g = 9.8; % 已知量

theta = [pi/2, pi/4, pi/6];
hs = t .* 100 .* cos(theta.');
vs = t .* 100 .* sin(theta.') - 0.5 * g .* t .* t;

figure()
plot(hs(1, :), vs(1, :), '-r', hs(2, :), vs(2, :), '--b' ...
    ,hs(3,:), vs(3,:), ':g',LineWidth=2)
xlabel('水平位移', 'FontSize',14)
ylabel('垂直位移', 'FontSize',14)
xlim([-100, max(hs(3, :)) + 100])
legend('\theta=90^\circ', '\theta=45^\circ', '\theta=30^\circ')

% 2
figure()
[X, Y] = meshgrid(theta, t);
hs_2 = Y .* 100 .* cos(X);
vs_2 = Y .* 100 .* sin(X) - 0.5 * g .* Y .* Y;
plot(hs_2, vs_2, LineWidth=2)
xlabel('水平位移', 'FontSize',14)
ylabel('垂直位移', 'FontSize',14)
xlim([-100, max(hs(3, :)) + 100])
legend('\theta=90^\circ', '\theta=45^\circ', '\theta=30^\circ')

%% 题目3
clear;clc;

x = 0:pi/100:20*pi;
y = x .* sin(x);
z = x .* cos(x);

% 1
figure()
plot(x, y, 'r', LineWidth=2)
title('X-Y关系图')
xlabel('X')
ylabel('Y')
% 2
figure()
polarplot(x, y, 'g', LineWidth=2)
% 3
figure()
plot3(x, y, z, LineWidth=2)
xlim([-10, 80])

%% 题目4

clear;clc;

x = -5:0.5:5;
y = -5:0.5:5;

[X, Y] = meshgrid(x, y);
Z = sin(sqrt(X.^2 + Y.^2));

figure('Name','两种不同函数画三维图')
% (1)
subplot(2, 1,1);
mesh(X, Y, Z);
title("使用mesh绘制的三维图");
% (2)
subplot(2, 1, 2);
surf(X, Y, Z);
title("使用mesh绘制的三维图");
% (3)
figure('name', '给输出着色，使用color尝试不同的颜色');
colormaps = ["hot", "winter", "cool", "spring"];
tiledlayout(2,2)
for i=1:4
    j = nexttile;
    surf(X, Y, Z)
    shading interp;
    colormap(j, eval(colormaps(i)))
    title(j, "使用colormaps中的"+colormaps(i), FontSize=15)
end

% (4)
figure('name', '绘制Z的等高线图');
contourf(X, Y, Z, LineWidth=2);
shading interp
xlabel('X');
ylabel('Y');
zlabel('Z');
title('Z的等高线');

% (5)
figure('name', '绘制Z的曲面图并加上等高线图');
surf(X, Y, Z)
hold on
contour3(X, Y, Z, 'LineWidth',2)
hold off

xlabel('X');
ylabel('Y');
zlabel('Z');
title('Z = sin(sqrt(X^2 + Y^2)) 曲面图 + 等高线');
colorbar;
colormap('jet');

%% 题目5

x = linspace(-2*pi, 2*pi, 100);
y = sin(x);

% 1.
draw = plot(x, y);
xlabel("X"); ylabel("Sin(x)");
set(draw,"color", "green", "LineStyle", "-.", "LineWidth", 2);

% 2.
fg = gcf;
set(fg, "color", "red", "name", "A Sine Function");

%3.
tick = gca;
set(tick, "color", "blue", "XScale", "log");


%% ch7 题目1
clc; clear;

% 1.
p1 = [1,2,4,0,5];
p2 = [1,2];
p3 = [0,1,2,3];

p2_3 = conv(p2, p3);
p = p1 + p2_3;
disp("P(x)的行系数为：")
disp(p)

%2.
sym_p = poly2sym(p);
disp("P(x)的一般表达式：")
disp(sym_p);

%3. 
r = roots(p);
disp("P(X)的根为：");
disp(r);

%4.
M = [-1, 1.2, 1.4;0.75, 2, 3.5; 0, 5, 2.5];
reslt = [];
for i=1:3
    for j=1:3
        result(i, j) = polyval(p,M(i, j));
    end
end
disp("x取矩阵M中每个值时，P(x)的值")
disp(result)

%% 题目2

clc;clear;
V = [1;2;3;4;5;6];
Pa = [2494;1247;831;623;499;416];

%a.
c1 = interp1(V,Pa, 3.8, "linear");
disp("体积为3.8m^3时气体的压强(线性插值)：");
disp(c1);

%b.
c2 = interp1(V, Pa, 3.8, "spline");
disp("体积为3.8m^3时气体的压强(三次样条插值)：");
disp(c2);

%c.
c3 = interp1(Pa, V, 1000, 'linear');
disp("气体压强为1000Kpa时气体的体积：");
disp(c3);

%d.
c4 = interp1(Pa, V, 1000, 'spline');
disp("气体压强为1000Kpa时气体的体积：");
disp(c4);

%% 题目3

V = [1;2;3;4;5;6];
Pa = [2494;1247;831;623;499;416];
vq = 1:0.2:6;
vq1 = interp1(V, Pa, vq, "linear");
figure
plot(V, Pa, 'o', vq, vq1, '-', LineWidth=2)
title("气体压强随体积的变化(T=300K)")
xlabel("体积(m^3)")
ylabel("压强(KPa)")

%% 题目4

V = [1;2;3;4;5;6];
Pa = [2494;1247;831;623;499;416];
vq = 1:0.2:6;

figure
plot(V, Pa, 'o', 'LineWidth',2)
hold on
for i=1:4
    pfit = polyfit(V, Pa, i);
    y1 = polyval(pfit, V); % 使用拟合函数计算
    
    poly1 = polyval(pfit, vq); % 增加数据点
    draw = plot(vq, poly1, 'LineWidth',2);
    legend('y','y_1', 'y_1', 'y_3', 'y_4', fontsize=15)
end
title("体积-Kpa不同阶数下拟合曲线")
xlabel("体积(m^3)")
ylabel("压强(KPa)")
hold off

%% 题目5

clc; clear;
N = power(1:1:10, 2);
n_sqrt = sqrt(N);
nq = 1:1:100;
y1 = interp1(N, n_sqrt, nq, 'spline');

plot(N, n_sqrt, '*r', nq, y1, '-b')
xlabel('N')
ylabel('sqrt(N)')
legend('y', 'y_1', fontsize=15)

