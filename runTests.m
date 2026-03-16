disp("Starting MATLAB CI pipeline")

addpath(genpath(pwd))

%% Static Code Analysis
disp("Running static code analysis...")

files = dir('*.m');

for k = 1:length(files)
    disp(['Checking ', files(k).name])
    checkcode(files(k).name);
end

%% Run Unit Tests
import matlab.unittest.TestRunner
import matlab.unittest.TestSuite
import matlab.unittest.plugins.XMLPlugin

suite = TestSuite.fromFolder('tests');

runner = TestRunner.withTextOutput;
runner.addPlugin(XMLPlugin.producingJUnitFormat('results.xml'));

results = runner.run(suite);

disp("Test execution completed")

assertSuccess(results)

disp("All tests passed successfully")

exit