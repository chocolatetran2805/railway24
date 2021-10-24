DROP DATABASE IF EXISTS testing_system_assignment_1;
CREATE DATABASE testing_system_assignment_1;
USE testing_system_assignment_1;

CREATE TABLE department(
department_id		INT,
department_name		VARCHAR(50)
);

CREATE TABLE possition(
position_id		INT,
position_name	VARCHAR(50)
);

CREATE TABLE account_1(
account_id		INT,
email			VARCHAR(50),
user_name		VARCHAR(50),
full_name		VARCHAR(50),
department_id	INT,
position_id		INT,
create_date		DATE
);

CREATE TABLE group_1(
group_id		INT,
group_name		VARCHAR(50),
create_id		INT,
create_date		DATE
);

CREATE TABLE group_account(
group_id		INT,
account_id		INT,
join_date		DATE
);

CREATE TABLE category_question(
category_id		INT,
category_name	VARCHAR(50)
);

CREATE TABLE question(
question_id		INT,
content			VARCHAR(50),
category_id		INT,
type_id			INT,
creator_id		INT,
create_date		DATE
);

CREATE TABLE answer(
answer_id		INT,
content			VARCHAR(50),
question_id		INT,
iscorrect		VARCHAR(20)
);

CREATE TABLE exam(
exam_id			INT,
code_1			INT,
title			VARCHAR(50),
category_id		VARCHAR(50),
duration		TIME,
creator_id		VARCHAR(50),
create_date		DATE
);

CREATE TABLE exam_question(
exam_id			INT,
question_id		INT
);




d