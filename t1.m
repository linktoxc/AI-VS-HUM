clear;
clc;

% 设置公共参数
theta1 = 0.2; theta = 0.3; apha = 0.8; A = 1; C1 = 12; C2 = 2; C3 = 50;
R = 8; R1 = 40; F = 2; S1 = 11; S2 = 0.5; delta = 0.7; lamda = 1.5;
gamma = 0.7; tao = 0.98; r = 0.75;

% 初始条件
initial_conditions = [0.5, 0.5];

% 时间跨度
tspan = [0, 1];

% 解微分方程
[t_wechat, y_wechat] = ode45(@(t, y) wechat(t, y, theta1, theta, apha, A, C1, C2, C3, R, R1, F), tspan, initial_conditions);
[t_HUN, y_HUN] = ode45(@(t, y) HUN(t, y, theta1, theta, apha, A, C1, C2, C3, R1, R, F, S1, S2, delta, lamda, gamma, tao, r), tspan, initial_conditions);
[t_COM, y_COM] = ode45(@(t, y) COM(t, y, theta1, theta, apha, A, C1, C2, C3, R1, R, F, S1, S2, delta, lamda, gamma, tao, r), tspan, initial_conditions);

% 绘图比较
figure;
hold on;

% 绘制 wechat 结果
plot(t_wechat, y_wechat(:, 1), 'r'); % y1
plot(t_wechat, y_wechat(:, 2), 'r-.'); % y2

% 绘制 HUN 结果
plot(t_HUN, y_HUN(:, 1), 'g'); % y1
plot(t_HUN, y_HUN(:, 2), 'g-.'); % y2

% 绘制 COM 结果
plot(t_COM, y_COM(:, 1), 'b'); % y1
plot(t_COM, y_COM(:, 2), 'b-.'); % y2

% 添加图例和标签
legend('AI enterprise', 'AI government', 'HUN enterprise', 'HUN government', 'COM enterprise', 'COM government');
xlabel('Time (t)', 'Interpreter', 'latex');
ylabel('p', 'Interpreter', 'latex');

% 设置坐标轴和网格线
axis([0 1 0 1]);
grid on;
set(gca, 'FontSize', 12, 'TickLabelInterpreter', 'latex', 'Color', [234/255, 234/255, 242/255]); % 设置坐标轴内背景为灰色
% 创建小图例放大虚线部分
axes('Position', [.6 .2 .25 .25]);
box on;
hold on;

% 放大 wechat y2
plot(t_wechat, y_wechat(:, 2), 'r-.');

% 放大 HUN y2
plot(t_HUN, y_HUN(:, 2), 'g-.');

% 放大 COM y2
plot(t_COM, y_COM(:, 2), 'b-.');

axis tight; % 自动调整坐标轴以展示放大区域

hold off;