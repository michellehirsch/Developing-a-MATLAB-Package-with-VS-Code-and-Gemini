%ex_shapes_area.m
% Demonstrates area calculations using the GeometryToolbox.

fprintf('--- Geometry Toolbox: Area Calculation Examples ---\n\n');

% Circle
radius_c = 5;
area_c = geometry.areaCircle(radius_c);
fprintf('Circle: Radius = %.2f, Area = %.4f\n', radius_c, area_c);

% Rectangle
length_r = 10;
width_r = 4;
area_r = geometry.areaRectangle(length_r, width_r);
fprintf('Rectangle: Length = %.2f, Width = %.2f, Area = %.4f\n', length_r, width_r, area_r);

% Square
side_s = 6;
area_s = geometry.areaSquare(side_s);
fprintf('Square: Side = %.2f, Area = %.4f\n', side_s, area_s);

% Triangle
base_t = 8;
height_t = 5;
area_t = geometry.areaTriangle(base_t, height_t);
fprintf('Triangle: Base = %.2f, Height = %.2f, Area = %.4f\n', base_t, height_t, area_t);

fprintf('\n--- End of Area Examples ---\n');

% To run this example, ensure GeometryToolbox is on the MATLAB path
% and then execute this script from the MATLAB command window.