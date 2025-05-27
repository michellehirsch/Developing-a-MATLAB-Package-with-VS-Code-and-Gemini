function area = areaCircle(radius)
%areaCircle Computes the area of a circle.
%   A = areaCircle(R) computes the area of a circle with radius R.
%
%   Inputs:
%       radius - Scalar, positive numeric value representing the radius.
%
%   Outputs:
%       area   - Scalar, the computed area of the circle.
%
%   Example:
%       r = 5;
%       a = geometry.areaCircle(r);
%       disp(['Area of a circle with radius ' num2str(r) ' is ' num2str(a)]);
%       % Expected output: Area of a circle with radius 5 is 78.5398
%
%   See also geometry.areaRectangle, geometry.areaSquare, geometry.areaTriangle, geometry.visualizeCircle.

%   Copyright YYYY Your Name or Company

    arguments
        radius (1,1) {mustBeNumeric, mustBeReal, mustBePositive}
    end

    area = pi * radius^2;

end