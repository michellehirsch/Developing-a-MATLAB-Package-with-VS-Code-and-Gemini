function createGeometryToolbox()
% createGeometryToolbox Defines and packages the GeometryToolbox using ToolboxOptions.
%   This function programmatically defines all the necessary metadata and
%   file inclusions for the GeometryToolbox and then packages it into an
%   .mltbx file.

% Determine the project root directory.
% This assumes the script is located in the project root.
projectRoot = fileparts(mfilename("fullpath"));

% --- 1. Create ToolboxOptions object and set the root folder ---
% The ToolboxRootFolder is the base against which relative paths for
% ToolboxMatlabPath and ToolboxFiles will be resolved.
UUID = "f8c3b4a9-3e5d-4f2a-8c1b-9e7d6a5b4c3d";
opts = matlab.addons.toolbox.ToolboxOptions(projectRoot, UUID);

opts.ToolboxName = "GeometryToolbox";
opts.ToolboxVersion = "1.0.0"; % Consider a strategy for version management

opts.AuthorName = "Michelle Hirsch";
opts.AuthorEmail = "mhirsch@mathworks.com"; 
opts.AuthorCompany = "MathWorks";         

opts.Summary = "A toolbox for geometry calculations and visualizations.";
opts.Description = "This toolbox provides functions for calculating areas of shapes and visualizing them. It includes examples, tests, and is licensed under the MIT license.";

% --- 5. Specify Files and Folders to Include ---
% ToolboxMatlabPath: Folders (relative to ToolboxRootFolder) to add to the
% MATLAB path when the toolbox is installed.
opts.ToolboxMatlabPath = "."; % Adds the ToolboxRootFolder itself to the path

% ToolboxFiles: All files and folders (relative to ToolboxRootFolder) to be
% included in the .mltbx package.
opts.ToolboxFiles = { ...
    "+geometry", ...
    "doc", ...
    "examples", ...
    "LICENSE", ...
    "README.md", ...
    "Contents.m" ...  % The top-level Contents.m for overall toolbox help
    };


% --- 7. Specify Output File ---
% The OutputFile path can be absolute or relative to the Current Working Directory (PWD)
% at the time matlab.addons.toolbox.packageToolbox is called.
% For clarity and robustness, we'll construct an absolute path.
outputDir = fullfile(projectRoot, "releases");
if ~isfolder(outputDir)
    mkdir(outputDir);
    disp("Created output directory: " + outputDir);
end
opts.OutputFile = fullfile(outputDir, "GeometryToolbox.mltbx");

% --- 8. Package the Toolbox ---
disp("Starting toolbox packaging...");
disp("  Toolbox Name: " + opts.ToolboxName);
disp("  Output File : " + opts.OutputFile);

try
    matlab.addons.toolbox.packageToolbox(opts);
    disp("Toolbox packaged successfully: " + opts.OutputFile);
catch ME
    fprintf(2, 'Error packaging toolbox:\n%s\n', ME.getReport('extended', 'hyperlinks', 'off'));
    rethrow(ME);
end

end