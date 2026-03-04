% plot_circ.m
function plot_circ(C, r)
    theta = linspace(0, 2*pi, 100); % Parameter for drawing the circle
    x = C(1) + r*cos(theta); % X-coordinates of the circle
    y = C(2) + r*sin(theta); % Y-coordinates of the circle
    plot(x, y, 'LineWidth', 2); % Plot the circle
    plot(C(1), C(2), 'r+', 'MarkerSize', 10, 'LineWidth', 2); % Plot the center
end
