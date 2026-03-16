disp("Starting MATLAB CI pipeline")

addpath(genpath(pwd))

import matlab.unittest.TestRunner
import matlab.unittest.plugins.XMLPlugin

suite = testsuite('tests');

runner = TestRunner.withTextOutput;

runner.addPlugin(XMLPlugin.producingJUnitFormat('results.xml'));

results = runner.run(suite);

assertSuccess(results)

disp("Tests completed successfully")

exit