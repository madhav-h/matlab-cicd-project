disp("Starting MATLAB CI pipeline")

addpath(genpath(pwd))

% Static analysis
disp("Running static code analysis...")
issues = checkcode('src');

if ~isempty(issues)
    disp("Warnings found:")
    disp(issues)
else
    disp("No issues found")
end

% Test setup
import matlab.unittest.TestRunner
import matlab.unittest.TestSuite
import matlab.unittest.plugins.XMLPlugin

suite = TestSuite.fromFolder('tests');

runner = TestRunner.withTextOutput;

runner.addPlugin(XMLPlugin.producingJUnitFormat('results.xml'));

results = runner.run(suite);

disp("Test execution completed")

assertSuccess(results)

disp("All tests passed")

exit