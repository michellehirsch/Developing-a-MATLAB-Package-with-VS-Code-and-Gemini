function h = visualizeCircle(radius, center)
%visualizeCircle Visualizes a circle.
%   H = visualizeCircle(R) visualizes a circle with radius R centered
%   at the origin [0,0].
%   H = visualizeCircle(R, C) visualizes a circle with radius R
%   centered at C, where C is a 1x2 vector [x, y].
%
%   Inputs:
%       radius - Scalar, positive numeric value for the radius.
%       center - (Optional) 1x2 numeric vector [x,y] for the center.
%                Defaults to [0,0].
%
%   Outputs:
%       h      - Graphics handle to the plotted circle(s).
%
%   Example:
%       figure;
%       h1 = geometry.visualizeCircle(5);
%       hold on;
%       h2 = geometry.visualizeCircle(3, [2, 2]);
%       hold off;
%       axis equal;
%       title('Visualized Circles');
%       legend([h1, h2], 'Circle 1', 'Circle 2');
%
%   See also geometry.areaCircle, viscircles, rectangle.

%   Copyright YYYY Your Name or Company

    arguments
        radius (1,1) {mustBeNumeric, mustBeReal, mustBePositive}
        center (1,2) {mustBeNumeric, mustBeReal} = [0,0]
    end

    h = viscircles(center, radius);
    axis equal; % Ensure the circle is not distorted
end