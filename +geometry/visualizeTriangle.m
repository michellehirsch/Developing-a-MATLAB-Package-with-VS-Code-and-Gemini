function h = visualizeTriangle(vertices, faceColor)
%visualizeTriangle Visualizes a triangle given its vertices.
%   H = visualizeTriangle(V) visualizes a triangle with vertices
%   defined by V, where V is a 3x2 matrix. Each row of V represents
%   the [x, y] coordinates of a vertex. The triangle is filled with blue.
%   H = visualizeTriangle(V, C) visualizes the triangle and fills it
%   with color C. C can be a color name (e.g., 'red'), short name ('r'),
%   or an RGB triplet.
%
%   Inputs:
%       vertices  - 3x2 numeric matrix, where each row is [x, y]
%                   coordinates of a vertex.
%       faceColor - (Optional) Color for the triangle face. Defaults to 'blue'.
%                   Can be a character vector (e.g., 'red', 'g') or an
%                   RGB triplet (e.g., [0 0.5 0.5]).
%
%   Outputs:
%       h         - Graphics handle to the plotted patch object (triangle).
%
%   Example:
%       figure;
%       verts = [0 0; 1 2; 2 0];
%       h = geometry.visualizeTriangle(verts, "green");
%       axis equal;
%       grid on;
%       title("Visualized Triangle");
%
%   See also geometry.areaTriangle, patch.

    arguments
        vertices  (3,2) {mustBeNumeric, mustBeReal}
        faceColor       {validatecolor} = "blue" % MATLAB's validatecolor can be used if available, or simple check
    end

    h = patch(vertices(:,1), vertices(:,2), faceColor);
    axis equal; % Ensure the triangle is not distorted
end