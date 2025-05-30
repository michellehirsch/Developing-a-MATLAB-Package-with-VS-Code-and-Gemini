function plan = buildfile
    plan = buildplan(localfunctions);

    % Define project and output file names
    prjFile = "GeometryToolbox.prj";
    mltbxOutputFile = fullfile("releases", "GeometryToolbox.mltbx");

    % Set up paths
    % Currently, code is all in a namespace in the project root, so just need root on path
    addpath(fileparts(which(mfilename)))        % Ensure that the project root is on path

    % Task for linting
    plan("lint") = matlab.buildtool.tasks.CodeIssuesTask(["+geometry", "examples", "tests"]); 

    % Task for running tests and generating a JUnit XML report
    plan("test") = matlab.buildtool.tasks.TestTask("tests", ... 
        TestResults = "test-results/results.xml"); % Specify output file for JUnit XML

    plan("test").Dependencies = "lint"; % Make test depend on lint passing

    % Task for packaging the toolbox
    plan("package") = matlab.buildtool.Task( ...
        Name = "Package Toolbox", ...
        Description = "Package the toolbox into an MLTBX file using " + prjFile, ...
        Actions = @PackageToolboxTask, ...
        Properties = struct( ... % Pass properties to the task function
            ProjectFile = prjFile, ...
            OutputFile = mltbxOutputFile ...
        ) ...
    );
    plan("package").Dependencies = "test"; % Package only if tests pass

    % Default tasks remain lint and test. 'package' will be called explicitly in CI.
    plan.DefaultTasks = ["lint", "test"];
end

function PackageToolboxTask(context)
    % Custom task function to package the toolbox.
    % The 'context' argument provides access to task properties and other build information.

    prjFile = context.Task.Properties.ProjectFile;
    outputFile = context.Task.Properties.OutputFile;

    % Ensure the output directory exists
    outputFolder = fileparts(outputFile);
    if ~isfolder(outputFolder)
        mkdir(outputFolder);
        disp("Created output folder for MLTBX: " + outputFolder);
    end

    disp("Packaging toolbox from project: " + prjFile);
    disp("Output MLTBX file will be: " + outputFile);
    
    matlab.addons.toolbox.packageToolbox(prjFile, outputFile);
    
    disp("Toolbox packaged successfully: " + outputFile);
end
