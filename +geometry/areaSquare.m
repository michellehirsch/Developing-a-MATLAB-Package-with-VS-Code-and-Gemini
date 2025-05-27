function area = areaSquare(side)
%areaSquare Computes the area of a square.
%   A = areaSquare(S) computes the area of a square with side length S.
%
%   Inputs:
%       side - Scalar, positive numeric value representing the side length.
%
%   Outputs:
%       area - Scalar, the computed area of the square.
%
%   Example:
%       s = 7;
%       a = geometry.areaSquare(s);
%       disp(['Area of a square with side ' num2str(s) ' is ' num2str(a)]);
%       % Expected output: Area of a square with side 7 is 49
%
%   See also geometry.areaCircle, geometry.areaRectangle, geometry.areaTriangle, geometry.visualizeSquare.

%   Copyright YYYY Your Name or Company

    arguments
        side (1,1) {mustBeNumeric, mustBeReal, mustBePositive}
    end

    area = side^2;

end