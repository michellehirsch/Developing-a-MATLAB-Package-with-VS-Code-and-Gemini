function plan = buildfile
    plan = buildplan(localfunctions);

    disp("Current folder is " + pwd + newline)
    s = which("geometry.areaTriangle");
    if isempty(s)
        disp("Can't find geometry.areaTriangle" + newline)
    else
        disp("Found geometry.areaTriangle at " + s + newline)
    end

    % Task for linting
    plan("lint") = matlab.buildtool.tasks.CodeIssuesTask(["+geometry", "examples", "tests"]); 

    % Task for running tests and generating a JUnit XML report
    plan("test") = matlab.buildtool.tasks.TestTask("tests", ... 
        TestResults = "test-results/results.xml"); % Specify output file for JUnit XML

    plan("test").Dependencies = "lint"; % Make test depend on lint passing

    plan.DefaultTasks = ["lint", "test"];
end
