disp("Starting MATLAB CI pipeline")

% Add all project folders to MATLAB path
addpath(genpath(pwd))

% -----------------------------
% Static Code Analysis
% -----------------------------
disp("Running static code analysis...")

issues = checkcode('src','-cyc');

if ~isempty(issues)
    disp("Code analysis warnings found:")
    disp(issues)
else
    disp("No static code issues found.")
end

% -----------------------------
% Setup Test Suite
% -----------------------------
import matlab.unittest.TestRunner
import matlab.unittest.TestSuite
import matlab.unittest.plugins.XMLPlugin
import matlab.unittest.plugins.CodeCoveragePlugin
import matlab.unittest.plugins.codecoverage.CoverageReport

suite = TestSuite.fromFolder('tests');

% -----------------------------
% Create Test Runner
% -----------------------------
runner = TestRunner.withTextOutput;

% Generate Jenkins compatible report
runner.addPlugin(XMLPlugin.producingJUnitFormat('results.xml'));

% Generate code coverage report
runner.addPlugin(CodeCoveragePlugin.forFolder('src', ...
    'Producing', CoverageReport));

% -----------------------------
% Run Tests
% -----------------------------
results = runner.run(suite);

disp("Test execution completed")

% -----------------------------
% Fail CI if tests fail
% -----------------------------
assertSuccess(results)

disp("All tests passed successfully")

exit