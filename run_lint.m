function run_lint
%RUN_LINT Runs MATLAB Code Analyzer (checkcode) on specified project folders.
%   Exits with a status of 1 if any linting issues are found, otherwise 0.

fprintf("Starting MATLAB Code Analyzer (checkcode)...\n");

%% Configuration
% Specify folders to analyze. These should be relative to the project root.
foldersToAnalyze = ["+geometry", "examples", "tests"]; 

%% Run Linting
fprintf("Analyzing folders: %s\n", strjoin(foldersToAnalyze, ", "));

try
    % Perform code analysis on the specified folders
    results = codeIssues(foldersToAnalyze);
catch ME
    fprintf("ERROR during code analysis process:\n");
    disp(ME.getReport);
    % If the codeIssues function itself errors, exit with failure
    return; % Or rethrow(ME) depending on desired behavior in deployed scenarios
end

%% Determine Exit Status
if ~isempty(results.Issues)
    fprintf("\nCode analysis found %d issues. See details below (or in CI logs).\n", numel(results.Issues));
    disp(results.Issues); % Display the table of issues
    if ~isdeployed % Do not exit if deployed
        exit(1); % Exit with a non-zero status code to fail the CI build
    end
else
    fprintf("\nNo code analysis issues found across all specified folders.\n");
end
end