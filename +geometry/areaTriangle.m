function area = areaTriangle(base, height)
%areaTriangle Computes the area of a triangle given base and height.
%   A = areaTriangle(B, H) computes the area of a triangle with
%   base B and height H.
%
%   Inputs:
%       base   - Scalar, positive numeric value representing the base.
%       height - Scalar, positive numeric value representing the height.
%
%   Outputs:
%       area   - Scalar, the computed area of the triangle.
%
%   Example:
%       b = 10;
%       h = 5;
%       a = geometry.areaTriangle(b, h);
%       disp("Area of a triangle (B=" + b + ", H=" + h + ") is " + a);
%       % Expected output: Area of a triangle (B=10, H=5) is 25
%
%   See also geometry.areaCircle, geometry.areaRectangle, geometry.areaSquare, geometry.visualizeTriangle.

    arguments
        base   (1,1) {mustBeNumeric, mustBeReal, mustBePositive}
        height (1,1) {mustBeNumeric, mustBeReal, mustBePositive}
    end

    area = 0.5 * base * height;

end