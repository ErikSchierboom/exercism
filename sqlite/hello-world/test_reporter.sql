-- Upadate message for failed tests to give helpful information:
UPDATE tests
SET message = 'Greeting is: ''' || actual.greeting || ''', but should be: ''' || tests.expected ||''''
FROM (SELECT greeting FROM hello_world) AS actual
WHERE  tests.status = 'fail';

-- Save results to ./output.json (needed by the online test-runner)
.mode json
.once './output.json'
SELECT name, status, message, output, test_code, task_id
FROM tests;

-- Display test results in readable form for the student:
.mode table
SELECT name, status, message
FROM tests;
