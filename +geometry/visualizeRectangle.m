function h = visualizeRectangle(lengthVal, widthVal, origin)
%visualizeRectangle Visualizes a rectangle.
%   H = visualizeRectangle(L, W) visualizes a rectangle with length L
%   and width W, with its bottom-left corner at the origin [0,0].
%   H = visualizeRectangle(L, W, O) visualizes the rectangle with its
%   bottom-left corner at O, where O is a 1x2 vector [x, y].
%
%   Inputs:
%       lengthVal - Scalar, positive numeric value for the length (y-extent).
%       widthVal  - Scalar, positive numeric value for the width (x-extent).
%       origin    - (Optional) 1x2 numeric vector [x,y] for the bottom-left
%                   corner. Defaults to [0,0].
%
%   Outputs:
%       h         - Graphics handle to the plotted rectangle.
%
%   Example:
%       figure;
%       h = geometry.visualizeRectangle(10, 5, [1, 1]);
%       axis equal;
%       grid on;
%       title('Visualized Rectangle');
%
%   See also geometry.areaRectangle, rectangle.

%   Copyright YYYY Your Name or Company

    arguments
        lengthVal (1,1) {mustBeNumeric, mustBeReal, mustBePositive}
        widthVal  (1,1) {mustBeNumeric, mustBeReal, mustBePositive}
        origin    (1,2) {mustBeNumeric, mustBeReal} = [0,0]
    end

    % MATLAB's rectangle 'Position' is [x, y, width, height]
    % Here, lengthVal corresponds to height, widthVal to width.
    position = [origin(1), origin(2), widthVal, lengthVal];
    h = rectangle('Position', position);
    axis equal; % Ensure the rectangle is not distorted
end