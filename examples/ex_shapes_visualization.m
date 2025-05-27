% ex_shapes_visualization.m
% Demonstrates shape visualization using the GeometryToolbox.

fprintf('--- Geometry Toolbox: Visualization Examples ---\n\n');

% Circle
figure;
subplot(2,2,1);
radius_c = 3;
center_c = [1, 1];
geometry.visualizeCircle(radius_c, center_c);
title(sprintf('Circle (R=%.1f, C=[%.1f,%.1f])', radius_c, center_c(1), center_c(2)));
axis([-2 5 -2 5]); % Set axis limits for better view
grid on;

% Rectangle
subplot(2,2,2);
length_r = 5;
width_r = 8;
origin_r = [-4, -2];
geometry.visualizeRectangle(length_r, width_r, origin_r);
title(sprintf('Rectangle (L=%.1f, W=%.1f, O=[%.1f,%.1f])', length_r, width_r, origin_r(1), origin_r(2)));
axis([-5 5 -3 4]);
grid on;

% Square
subplot(2,2,3);
side_s = 4;
origin_s = [-1, -1];
h_square = geometry.visualizeSquare(side_s, origin_s);
set(h_square, 'EdgeColor', 'r', 'LineWidth', 2); % Customize appearance
title(sprintf('Square (S=%.1f, O=[%.1f,%.1f])', side_s, origin_s(1), origin_s(2)));
axis([-2 5 -2 5]);
grid on;

% Triangle
subplot(2,2,4);
vertices_t = [0 0; 3 4; 5 1]; % Define triangle vertices
geometry.visualizeTriangle(vertices_t, 'magenta');
title(sprintf('Triangle (Vertices given)'));
axis([-1 6 -1 5]);
grid on;

sgtitle('Geometry Toolbox: Shape Visualizations'); % Super title for the figure

fprintf('\n--- End of Visualization Examples ---\n');