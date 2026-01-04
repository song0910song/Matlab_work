%% 题目1

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
plot(x, y, LineWidth=2)
title('X-Y关系图')
xlabel('X')
ylabel('Y')
% 2
figure()
polarplot(x, y, LineWidth=2)
% 3
figure()
plot3(x, y, z, LineWidth=2)
xlim([-10, 80])

%% 题目4



