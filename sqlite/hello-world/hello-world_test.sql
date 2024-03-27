-- Setup test table and read in student solution:
.read ./test_setup.sql

-- Test cases:
INSERT INTO tests (name, uuid,
                    expected)
    VALUES
        ('Say Hi!', 'af9ffe10-dc13-42d8-a742-e7bdafac449d',
            'Hello, World!');

-- Comparison of user input and the tests updates the status for each test:
UPDATE tests
SET status = 'pass'
FROM (SELECT greeting FROM hello_world) AS actual
WHERE actual.greeting = tests.expected;

-- Write results and debug info:
.read ./test_reporter.sql
