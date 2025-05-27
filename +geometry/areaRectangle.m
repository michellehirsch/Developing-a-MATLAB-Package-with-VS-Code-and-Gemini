function area = areaRectangle(length, width)
%areaRectangle Computes the area of a rectangle.
%   A = areaRectangle(L, W) computes the area of a rectangle with
%   length L and width W.
%
%   Inputs:
%       length - Scalar, positive numeric value representing the length.
%       width  - Scalar, positive numeric value representing the width.
%
%   Outputs:
%       area   - Scalar, the computed area of the rectangle.
%
%   Example:
%       l = 10;
%       w = 5;
%       a = geometry.areaRectangle(l, w); % Note: 'length' is a built-in function, consider renaming the input variable
%       disp("Area of a rectangle (L=" + l + ", W=" + w + ") is " + a);
%       % Expected output: Area of a rectangle (L=10, W=5) is 50
%
%   See also geometry.areaCircle, geometry.areaSquare, geometry.areaTriangle, geometry.visualizeRectangle.

    arguments
        length (1,1) {mustBeNumeric, mustBeReal, mustBePositive} % Consider renaming to avoid conflict with built-in 'length'
        width  (1,1) {mustBeNumeric, mustBeReal, mustBePositive}
    end

    area = length * width;

end