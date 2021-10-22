CREATE DATABASE testing_system_assignment_1;
USE testing_system_assignment_1;
CREATE TABLE department(
department_id	INT,
department_name	VARCHAR(50)
);
CREATE TABLE position_1(
position_id		INT,
position_name	VARCHAR(50)
);
CREATE TABLE account_1(
account_id	INT,
email	VARCHAR(20),
username	VARCHAR(20),
fullname	VARCHAR(20),
department_id	INT,
position_id	VARCHAR(20),
create_date		DATE
);
CREATE TABLE group_1(
group_id	INT,
group_name	VARCHAR(20),
creator_id	VARCHAR(20),
create_date	DATE
);
CREATE TABLE group_account(
group_id	INT,
account_id	VARCHAR(20),
join_date	DATE
);
