classdef TestVisualizationFunctions < matlab.unittest.TestCase
    %TestVisualizationFunctions Tests for the visualization functions in the geometry package.
    %   These tests primarily check if visualization functions execute without error
    %   and return valid graphics handles. They also manage figure creation and cleanup.

    properties
        TestFigure % Handle to the figure used for testing
    end

    methods(TestMethodSetup)
        function createFigure(testCase)
            % Create a new figure for each test method to avoid interference
            testCase.TestFigure = figure('Visible', 'off'); % Keep invisible during tests
        end
    end

    methods(TestMethodTeardown)
        function closeFigure(testCase)
            % Close the figure after each test method
            if ~isempty(testCase.TestFigure) && isvalid(testCase.TestFigure)
                close(testCase.TestFigure);
            end
        end
    end

    methods (Test)
        function testVisualizeCircle_DefaultCenter(testCase)
            radius = 5;
            h = geometry.visualizeCircle(radius);
            testCase.verifyNotEmpty(h, "Function should return a graphics handle.");
            % viscircles returns a Group object in recent MATLAB versions
            testCase.verifyClass(h, ?matlab.graphics.primitive.Group, ...
                "Handle should be of type matlab.graphics.primitive.Group for viscircles.");
        end

        function testVisualizeCircle_SpecifiedCenter(testCase)
            radius = 3;
            center = [2, 2];
            h = geometry.visualizeCircle(radius, center);
            testCase.verifyNotEmpty(h, "Function should return a graphics handle.");
            testCase.verifyClass(h, ?matlab.graphics.primitive.Group);
        end

        function testVisualizeRectangle_DefaultOrigin(testCase)
            len = 10;
            wid = 5;
            h = geometry.visualizeRectangle(len, wid);
            testCase.verifyNotEmpty(h, "Function should return a graphics handle.");
            testCase.verifyClass(h, ?matlab.graphics.primitive.Rectangle, ...
                "Handle should be of type matlab.graphics.primitive.Rectangle.");
        end

        function testVisualizeRectangle_SpecifiedOrigin(testCase)
            len = 8;
            wid = 4;
            origin = [1, -1];
            h = geometry.visualizeRectangle(len, wid, origin);
            testCase.verifyNotEmpty(h, "Function should return a graphics handle.");
            testCase.verifyClass(h, ?matlab.graphics.primitive.Rectangle);
        end

        function testVisualizeSquare_DefaultOrigin(testCase)
            side = 6;
            h = geometry.visualizeSquare(side);
            testCase.verifyNotEmpty(h, "Function should return a graphics handle.");
            testCase.verifyClass(h, ?matlab.graphics.primitive.Rectangle, ...
                "Handle should be of type matlab.graphics.primitive.Rectangle for a square.");
        end

        function testVisualizeSquare_SpecifiedOrigin(testCase)
            side = 4;
            origin = [-2, -2];
            h = geometry.visualizeSquare(side, origin);
            testCase.verifyNotEmpty(h, "Function should return a graphics handle.");
            testCase.verifyClass(h, ?matlab.graphics.primitive.Rectangle);
        end

        function testVisualizeTriangle_ValidVertices(testCase)
            vertices = [0 0; 1 2; 2 0];
            h = geometry.visualizeTriangle(vertices);
            testCase.verifyNotEmpty(h, "Function should return a graphics handle.");
            testCase.verifyClass(h, ?matlab.graphics.primitive.Patch, ...
                "Handle should be of type matlab.graphics.primitive.Patch for a triangle.");
        end

        function testVisualizeTriangle_WithColor(testCase)
            vertices = [0 0; 0 1; 1 0];
            h = geometry.visualizeTriangle(vertices, "red");
            testCase.verifyNotEmpty(h, "Function should return a graphics handle.");
            testCase.verifyClass(h, ?matlab.graphics.primitive.Patch);
            testCase.verifyEqual(h.FaceColor, [1 0 0], "AbsTol", 0.01, "Triangle color not set as expected.");
        end
    end
end