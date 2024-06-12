clear;
clc;

% 设置公共参数
theta1=0.2,theta=0.3,apha=0.8,A=1,C1=12,C2=2,C3=50,R=8,R1=40,F=2;

% 设置不同的A值
A_values = [0.5, 1, 5, 10, 20];
colors = ['r', 'g', 'b', 'c', 'm', 'y']; % 颜色数组
legend_entries = {};

figure(1);

% 对每个A值进行仿真
for idx = 1:length(A_values)
    A = A_values(idx);
    color = colors(idx);

    [t, y] = ode45(@(t, y) wechat(t,y,theta1,theta,apha,A,C1,C2,C3,R,R1,F), [0 1], [0.5, 0.5]);
    
    % 绘制结果
    plot(t, y(:, 1), strcat('-', color), 'LineWidth', 1);
    hold on;
    plot(t, y(:, 2), strcat('-', '.', color), 'LineWidth', 1);
    hold on;

    % 更新图例条目
    legend_entries{end+1} = ['enterprise: A=', num2str(A)];
    legend_entries{end+1} = ['government: A=', num2str(A)];
end

% 设置图表标签和图例
xlabel('Time (t)', 'Interpreter', 'latex');
ylabel('(p)', 'Interpreter', 'latex', 'Rotation', 0);
legend(legend_entries, 'Location', 'best');

% 设置坐标轴和网格线
axis([0 1 0 1]);
grid on;
set(gca, 'FontSize', 12, 'TickLabelInterpreter', 'latex', 'Color', [234/255, 234/255, 242/255]); % 设置坐标轴内背景为灰色
