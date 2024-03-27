-- Create database:
.read ./create_fixture.sql

-- Read user student solution and save any output as markdown in user_output.md:
.mode markdown
.output user_output.md
.read ./hello-world.sql
.output

-- Create a clean testing environment:
DROP TABLE IF EXISTS main.tests;
CREATE TABLE IF NOT EXISTS main.tests (
    -- uuid and name (description) are taken from the test.toml file
    uuid TEXT PRIMARY KEY,
	name TEXT NOT NULL,
    -- The following section is needed by the online test-runner
    status TEXT DEFAULT 'fail',
    message TEXT,
    output TEXT,
    test_code TEXT,
    task_id INTEGER DEFAULT NULL,
    -- Here are columns for the actual tests
    expected TEXT NOT NULL
);
