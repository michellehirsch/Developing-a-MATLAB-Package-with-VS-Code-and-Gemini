classdef TestAreaFunctions < matlab.unittest.TestCase
    %TestAreaFunctions Tests for the area calculation functions in the geometry package.

    properties
        TestData
    end

    methods(TestMethodSetup)
        function setupTestData(testCase)
            % Common test data
            testCase.TestData.PositiveValue = 5;
            testCase.TestData.AnotherPositiveValue = 10;
            testCase.TestData.SmallPositiveValue = 1e-6;
            testCase.TestData.ZeroValue = 0;
            testCase.TestData.NegativeValue = -5;
            testCase.TestData.NonNumericValue = "abc";
        end
    end

    methods (Test)
        % Test methods for areaCircle
        function testAreaCircle_PositiveRadius(testCase)
            radius = testCase.TestData.PositiveValue;
            expectedArea = pi * radius^2;
            actualArea = geometry.areaCircle(radius);
            testCase.verifyEqual(actualArea, expectedArea, "AbsTol", 1e-6, ...
                "Area of circle with positive radius is incorrect.");
        end

        function testAreaCircle_SmallRadius(testCase)
            radius = testCase.TestData.SmallPositiveValue;
            expectedArea = pi * radius^2;
            actualArea = geometry.areaCircle(radius);
            testCase.verifyEqual(actualArea, expectedArea, "AbsTol", 1e-12, ...
                "Area of circle with small positive radius is incorrect.");
        end

        function testAreaCircle_InvalidInputs(testCase)
            testCase.verifyError(@() geometry.areaCircle(testCase.TestData.ZeroValue), ...
                "MATLAB:validators:mustBePositive", "Zero radius should throw error.");
            testCase.verifyError(@() geometry.areaCircle(testCase.TestData.NegativeValue), ...
                "MATLAB:validators:mustBePositive", "Negative radius should throw error.");
            testCase.verifyError(@() geometry.areaCircle(testCase.TestData.NonNumericValue), ...
                "MATLAB:validators:mustBeNumeric", "Non-numeric radius should throw error.");
        end

        % Test methods for areaRectangle
        function testAreaRectangle_PositiveDimensions(testCase)
            len = testCase.TestData.PositiveValue;
            wid = testCase.TestData.AnotherPositiveValue;
            expectedArea = len * wid;
            actualArea = geometry.areaRectangle(len, wid);
            testCase.verifyEqual(actualArea, expectedArea, ...
                "Area of rectangle with positive dimensions is incorrect.");
        end

        function testAreaRectangle_InvalidInputs(testCase)
            validDim = testCase.TestData.PositiveValue;
            testCase.verifyError(@() geometry.areaRectangle(testCase.TestData.ZeroValue, validDim), ...
                "MATLAB:validators:mustBePositive", "Zero length should throw error.");
            testCase.verifyError(@() geometry.areaRectangle(validDim, testCase.TestData.NegativeValue), ...
                "MATLAB:validators:mustBePositive", "Negative width should throw error.");
            testCase.verifyError(@() geometry.areaRectangle(testCase.TestData.NonNumericValue, validDim), ...
                "MATLAB:validators:mustBeNumeric", "Non-numeric length should throw error.");
        end

        % Test methods for areaSquare
        function testAreaSquare_PositiveSide(testCase)
            side = testCase.TestData.PositiveValue;
            expectedArea = side^2;
            actualArea = geometry.areaSquare(side);
            testCase.verifyEqual(actualArea, expectedArea, ...
                "Area of square with positive side is incorrect.");
        end

        function testAreaSquare_InvalidInputs(testCase)
            testCase.verifyError(@() geometry.areaSquare(testCase.TestData.ZeroValue), ...
                "MATLAB:validators:mustBePositive", "Zero side should throw error.");
            testCase.verifyError(@() geometry.areaSquare(testCase.TestData.NegativeValue), ...
                "MATLAB:validators:mustBePositive", "Negative side should throw error.");
            testCase.verifyError(@() geometry.areaSquare(testCase.TestData.NonNumericValue), ...
                "MATLAB:validators:mustBeNumeric", "Non-numeric side should throw error.");
        end

        % Test methods for areaTriangle
        function testAreaTriangle_PositiveDimensions(testCase)
            base = testCase.TestData.PositiveValue;
            height = testCase.TestData.AnotherPositiveValue;
            expectedArea = 0.5 * base * height;
            actualArea = geometry.areaTriangle(base, height);
            testCase.verifyEqual(actualArea, expectedArea, ...
                "Area of triangle with positive dimensions is incorrect.");
        end

        function testAreaTriangle_InvalidInputs(testCase)
            validDim = testCase.TestData.PositiveValue;
            testCase.verifyError(@() geometry.areaTriangle(testCase.TestData.ZeroValue, validDim), ...
                "MATLAB:validators:mustBePositive", "Zero base should throw error.");
            testCase.verifyError(@() geometry.areaTriangle(validDim, testCase.TestData.NegativeValue), ...
                "MATLAB:validators:mustBePositive", "Negative height should throw error.");
            testCase.verifyError(@() geometry.areaTriangle(testCase.TestData.NonNumericValue, validDim), ...
                "MATLAB:validators:mustBeNumeric", "Non-numeric base should throw error.");
        end

    end
end