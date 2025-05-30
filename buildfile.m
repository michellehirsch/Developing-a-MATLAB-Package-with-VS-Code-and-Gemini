function plan = buildfile
    plan = buildplan(localfunctions);

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
        Description = "Package the toolbox into an MLTBX file using createGeometryToolbox.m script.", ...
        Actions = @createGeometryToolbox ... 
    );
    % plan("package").Dependencies = "test"; 
    % For CI, the workflow will explicitly run 'test' (which includes 'lint')
    % before 'package', and only proceed to package if the 'test' step succeeds.
    % Removing this direct dependency prevents 'buildtool package' (when invoked in isolation
    % in a later CI step) from re-running tests.
    % For a local build that includes lint, test, and package, run: 'buildtool test package'.

    % Default tasks remain lint and test. 'package' will be called explicitly in CI.
    plan.DefaultTasks = ["lint", "test"];
end
