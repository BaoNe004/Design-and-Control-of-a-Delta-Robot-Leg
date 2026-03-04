    clc; clear; close all; format compact; format shortG;
    
    % Define circle centers and radii
    A = [0, 0]';
    B = [5, 0]';
    x0 = [0, -4]'; % Initial guess
    
    l1 = 4; % Radius for circle at A
    l2 = 4; % Radius for circle at B
    l3 = 7; % Radius for circle at P
    l4 = 4; % Radius for last circle (center E)
    rP = 1; % Radius of the circle on which P will move
    centerP = [7, -6.5]'; % Center of the circle on which P will move
    
    % Define the range of angles for animation
    theta_range = linspace(0, -2*pi, 100); % Full circle for P
    
    % Calculate the trajectory of P
    x = centerP(1) + rP * cos(theta_range);
    y = centerP(2) + rP * sin(theta_range);
    
    % Create the figure for animation
    figure; hold on; grid on;
    axis equal;
    
    % Plot the trajectory of P
    plot(x, y, '--', 'Color', [0.6, 0.6, 0.6]); % Dashed circle for P's trajectory
    
    % Set the axis limits
    xlim([-10 10]);
    ylim([-10 10]);
    
    for theta = theta_range
        % Update the position of P to move around a circle
        P = centerP + rP * [cos(theta); sin(theta)];
    
        % Find the intersection point D of circles at A and P
        D = lsqnonlin(@(x) func_list(x, A, l1, P, l3), x0);
    
        % Calculate center E for the next circle as 0.3 times the vector from P to D
        E = 0.3 * (P - D) + D;
    
        % Find the intersection point C of circles at B and E
        C = lsqnonlin(@(x) func_list(x, B, l2, E, l4), [8,-4]');
    
        % Clear previous plot
        cla;
    
        % Plot the trajectory of P
        plot(x, y, '--', 'Color', [0.6, 0.6, 0.6]); % Dashed circle for P's trajectory
    
        % Add lines to visualize geometry
        line([A(1), B(1)], [A(2), B(2)], 'Color', 'k');
        line([A(1), D(1)], [A(2), D(2)], 'Color', 'k');
        line([D(1), P(1)], [D(2), P(2)], 'Color', 'k');
        line([B(1), C(1)], [B(2), C(2)], 'Color', 'k');
        line([C(1), E(1)], [C(2), E(2)], 'color', 'k');
    
        % Labeling points
        text(A(1), A(2), 'A', 'VerticalAlignment', 'top', 'HorizontalAlignment', 'right');
        text(B(1), B(2), 'B', 'VerticalAlignment', 'top', 'HorizontalAlignment', 'left');
        text(P(1), P(2), 'P', 'VerticalAlignment', 'bottom', 'HorizontalAlignment', 'left');
        text(D(1), D(2), 'D', 'VerticalAlignment', 'top', 'HorizontalAlignment', 'left');
        text(E(1), E(2), 'E', 'VerticalAlignment', 'bottom', 'HorizontalAlignment', 'right');
        text(C(1), C(2), 'C', 'VerticalAlignment', 'bottom', 'HorizontalAlignment', 'left');
    
        % Plot points
        plot(A(1), A(2), 'ko', 'MarkerFaceColor', 'r');
        plot(B(1), B(2), 'ko', 'MarkerFaceColor', 'r');
        plot(C(1), C(2), 'ko', 'MarkerFaceColor', 'r');
        plot(D(1), D(2), 'ko', 'MarkerFaceColor', 'r');
        plot(E(1), E(2), 'ko', 'MarkerFaceColor', 'r');
        plot(P(1), P(2), 'ko', 'MarkerFaceColor', 'r');
    
        % Pause to create animation effect
        pause(0.05); % Adjust speed of animation
    end
