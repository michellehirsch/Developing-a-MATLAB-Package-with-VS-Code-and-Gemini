# GeometryToolbox for MATLAB

**A collection of functions for computing the area and visualizing common two-dimensional shapes.**

Version 1.0.0

## Overview

The `GeometryToolbox` provides a convenient set of MATLAB functions to:

*   Calculate the area of common 2D geometric shapes:
    *   Circles
    *   Rectangles
    *   Squares
    *   Triangles (given base and height)
*   Visualize these shapes in MATLAB figures.

All functions are organized within the `+geometry` package, ensuring a clean namespace and easy integration into your projects.

## Features

*   **Area Calculations:** Simple and direct functions for area computation.
*   **Shape Visualization:** Functions to quickly plot shapes with customizable options.
*   **Namespaced Functions:** Avoids conflicts with other toolboxes or MATLAB's built-in functions (e.g., `geometry.areaCircle()`).
*   **Input Validation:** Functions include argument validation for robustness.
*   **Clear Documentation:** Each function includes detailed help text accessible via `help geometry.functionName`.
*   **Examples Provided:** Includes example scripts to demonstrate usage.

## Folder Structure

```
GeometryToolbox/
├── +geometry/         # Core package functions
│   ├── areaCircle.m
│   ├── areaRectangle.m
│   ├── ... (other function .m files)
│   └── Contents.m
├── doc/               # Documentation files (helptoc.xml, HTML pages)
├── examples/          # Example scripts demonstrating toolbox usage
│   ├── ex_shapes_area.m
│   └── ex_shapes_visualization.m
├── tests/             # Unit tests for the toolbox
│   ├── TestAreaFunctions.m
│   └── TestVisualizationFunctions.m
├── Contents.m         # Top-level toolbox help
├── info.xml           # Toolbox packaging information for Add-On Manager
└── README.md          # This file
```

## Installation

There are two main ways to install and use the `GeometryToolbox`:

1.  **Add to MATLAB Path (Manual):**
    *   Clone or download this repository/folder.
    *   In MATLAB, add the root `GeometryToolbox` directory to your path:
        ```matlab
        addpath("your/path/to/GeometryToolbox");
        % To include subfolders like examples and doc (optional for core functionality but good for access):
        addpath(genpath("your/path/to/GeometryToolbox"));
        savepath; % Optional: to save the path for future MATLAB sessions
        ```

2.  **Install as MATLAB Add-On (`.mltbx` file):**
    *   If you have a `.mltbx` file for this toolbox (which can be created using MATLAB's packaging tools), simply double-click it. MATLAB will guide you through the installation process. This is the recommended way for easy management.

## Usage

All functions are part of the `geometry` package. To call a function, prefix it with `geometry.`:

### Calculating Area

```matlab
%% Calculate the area of a circle
radius = 7.5;
circleArea = geometry.areaCircle(radius);
disp("The area of the circle is: " + circleArea);
% Expected output: The area of the circle is: 176.7146

%% Calculate the area of a rectangle
rectLength = 10;
rectWidth = 5;
rectangleArea = geometry.areaRectangle(rectLength, rectWidth);
disp("The area of the rectangle is: " + rectangleArea);
% Expected output: The area of the rectangle is: 50
```

### Visualizing Shapes

```matlab
%% Visualize a square
figure;
sideLength = 4;
originPoint = [1, 1];
geometry.visualizeSquare(sideLength, originPoint);
title("My Square");
axis equal;
grid on;
```

## Available Functions

For a full list of functions within the `geometry` package, type the following in the MATLAB Command Window:
```matlab
help geometry
```
To get help for a specific function (e.g., `areaCircle`):
```matlab
help geometry.areaCircle
```

## Examples

Check the `examples/` directory for scripts demonstrating various functionalities of the toolbox:
*   `ex_shapes_area.m`: Demonstrates area calculations.
*   `ex_shapes_visualization.m`: Demonstrates shape visualizations.

## Documentation

Further documentation, if generated into HTML format, can be accessed via the MATLAB Help browser once the toolbox is installed and the `doc` folder's search database is built (e.g., by running `builddocsearchdb` in the `doc` folder).

## Running Tests

This toolbox includes a suite of unit tests to ensure its functionality. To run the tests:

1.  Ensure the `GeometryToolbox` root directory (and its `tests` subfolder) is on the MATLAB path.
2.  Navigate to the `GeometryToolbox` root directory in MATLAB's Current Folder browser.
3.  Execute the following command in the MATLAB Command Window:

    ```matlab
    results = runtests('tests'); % Runs all tests in the 'tests' folder
    % To display a table of results:
    table(results)
    ```

Alternatively, you can use the MATLAB Test Browser:
*   Go to the "Editor" or "Live Editor" tab.
*   In the "File" section, click "Run Tests".
*   Or, open the Test Browser from the "Apps" tab (search for "Test Browser").

Further documentation, if generated into HTML format, can be accessed via the MATLAB Help browser once the toolbox is installed and the `doc` folder's search database is built (e.g., by running `builddocsearchdb` in the `doc` folder).

## Running Tests

This toolbox includes a suite of unit tests to ensure its functionality. To run the tests:

1.  Ensure the `GeometryToolbox` root directory (and its `tests` subfolder) is on the MATLAB path.
2.  Navigate to the `GeometryToolbox` root directory in MATLAB's Current Folder browser.
3.  Execute the following command in the MATLAB Command Window:

    ```matlab
    results = runtests('tests'); % Runs all tests in the 'tests' folder
    % To display a table of results:
    table(results)
    ```

Alternatively, you can use the MATLAB Test Browser:
*   Go to the "Editor" or "Live Editor" tab.
*   In the "File" section, click "Run Tests".
*   Or, open the Test Browser from the "Apps" tab (search for "Test Browser").

Further documentation, if generated into HTML format, can be accessed via the MATLAB Help browser once the toolbox is installed and the `doc` folder's search database is built (e.g., by running `builddocsearchdb` in the `doc` folder).