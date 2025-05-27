function plan = buildfile
    plan = buildplan(localfunctions);

    % Task for linting
    plan("lint") = matlab.buildtool.tasks.CodeIssuesTask(["+geometry", "examples", "tests"]); 

    % Task for running tests
    plan("test") = matlab.buildtool.tasks.TestTask("tests"); % Specify source folder for test discovery
    plan("test").Dependencies = "lint"; % Make test depend on lint passing

    plan.DefaultTasks = ["lint", "test"];
end
