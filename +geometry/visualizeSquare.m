function h = visualizeSquare(side, origin)
%visualizeSquare Visualizes a square.
%   H = visualizeSquare(S) visualizes a square with side length S,
%   with its bottom-left corner at the origin [0,0].
%   H = visualizeSquare(S, O) visualizes the square with its
%   bottom-left corner at O, where O is a 1x2 vector [x, y].
%
%   Inputs:
%       side   - Scalar, positive numeric value for the side length.
%       origin - (Optional) 1x2 numeric vector [x,y] for the bottom-left
%                corner. Defaults to [0,0].
%
%   Outputs:
%       h      - Graphics handle to the plotted square.
%
%   Example:
%       figure;
%       h = geometry.visualizeSquare(5, [1,1]);
%       axis equal;
%       grid on;
%       title('Visualized Square');
%
%   See also geometry.areaSquare, geometry.visualizeRectangle, rectangle.

%   Copyright YYYY Your Name or Company

    arguments
        side   (1,1) {mustBeNumeric, mustBeReal, mustBePositive}
        origin (1,2) {mustBeNumeric, mustBeReal} = [0,0]
    end

    % A square is a rectangle with equal length and width
    % Use visualizeRectangle or directly use rectangle function
    position = [origin(1), origin(2), side, side];
    h = rectangle('Position', position);
    axis equal; % Ensure the square is not distorted
end