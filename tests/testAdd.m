classdef testAdd < matlab.unittest.TestCase

methods(Test)

function testAddition(testCase)

result = addNumbers(2,3);

testCase.verifyEqual(result,5);

end

end

end