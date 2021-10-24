DROP DATABASE IF EXISTS testing_system_assignment_2;
CREATE DATABASE testing_system_assignment_2;
USE testing_system_assignment_2;

CREATE TABLE department(
department_id		TINYINT UNSIGNED PRIMARY KEY AUTO_INCREMENT,
department_name		VARCHAR(50) NOT NULL UNIQUE KEY check(length(department_name)>6)
);

CREATE TABLE possition(
position_id		TINYINT UNSIGNED PRIMARY KEY AUTO_INCREMENT,
position_name	VARCHAR(50) check(length(possition-name)>6)
);

CREATE TABLE account1(
account_id		TINYINT UNSIGNED PRIMARY KEY AUTO_INCREMENT,
email			VARCHAR(50) NOT NULL UNIQUE KEY check(length(email)>=6),
user_name		VARCHAR(50) UNIQUE check(length(user_name)>=6),
full_name		VARCHAR(50) check(length(full_name)>=8),
department_id	TINYINT UNSIGNED,
position_id		TINYINT UNSIGNED,
create_date		DATETIME,
FOREIGN KEY (department_id)REFERENCES department(department_id)
);

CREATE TABLE group1(
group_id		TINYINT UNSIGNED PRIMARY KEY,
group_name		VARCHAR(50) NOT NULL UNIQUE KEY,
creator_id		TINYINT UNSIGNED,
create_date		DATETIME,
FOREIGN KEY (creator_id) REFERENCES account1(account_id)
);

CREATE TABLE group_account(
group_id		TINYINT UNSIGNED NOT NULL,
account_id		TINYINT UNSIGNED NOT NULL,
join_date		DATETIME,
FOREIGN KEY (group_id) REFERENCES group1(group_id),
FOREIGN KEY (account_id) REFERENCES account1(account_id),
PRIMARY KEY (group_id,account_id)
);

CREATE TABLE typequestion(
type_id			TINYINT UNSIGNED PRIMARY KEY AUTO_INCREMENT,
typename		ENUM('Essay', 'Multiple-Choice') NOT NULL
);

CREATE TABLE category_question(
category_id		TINYINT UNSIGNED PRIMARY KEY AUTO_INCREMENT,
category_name	VARCHAR(50) NOT NULL
);

CREATE TABLE question(
question_id		TINYINT UNSIGNED PRIMARY KEY AUTO_INCREMENT,
content			VARCHAR(100) NOT NULL,
category_id		TINYINT UNSIGNED NOT NULL,
type_id			TINYINT UNSIGNED NOT NULL,
creator_id		TINYINT UNSIGNED NOT NULL,
create_date		DATETIME,
FOREIGN KEY (category_id) REFERENCES category_question(category_id),
FOREIGN KEY (type_id) 	REFERENCES typequestion(type_id),
FOREIGN KEY (creator_id) REFERENCES account1(account_id)
);

CREATE TABLE answer(
answer_id		TINYINT UNSIGNED PRIMARY KEY AUTO_INCREMENT,
content			VARCHAR(100) NOT NULL,
question_id		TINYINT UNSIGNED NOT NULL,
iscorrect		ENUM ('T','F'),
FOREIGN KEY (question_id) REFERENCES question(question_id)
);

CREATE TABLE exam(
exam_id			TINYINT UNSIGNED PRIMARY KEY AUTO_INCREMENT,
code_1			VARCHAR(20) NOT NULL,
title			VARCHAR(50) NOT NULL,
category_id		TINYINT UNSIGNED NOT NULL,
duration		TINYINT UNSIGNED NOT NULL,
creator_id		TINYINT UNSIGNED NOT NULL,
create_date		DATETIME,
FOREIGN KEY (category_id) REFERENCES category_question(category_id),
FOREIGN KEY (creator_id) REFERENCES account1(account_id)
);

CREATE TABLE ExamQuestion(
Exam_ID			TINYINT UNSIGNED NOT NULL,
Question_ID		TINYINT UNSIGNED NOT NULL,
FOREIGN KEY (Exam_ID) REFERENCES exam(exam_id),
FOREIGN KEY (Question_ID) REFERENCES question(question_id),
PRIMARY KEY (Exam_ID,Question_ID)
);

INSERT INTO department(department_name)
VALUES			(N'kỹ thuật' ),
                (N'tài chính' ),
                (N'phó giám đốc' ),
                (n'giám đốc' ),
                (N'thư ký' );
                
INSERT INTO possition(possition_name)
VALUES			('dev' ),
				('test' ),
                ('scrum master' ),
                ('PM' ),
                ('QA' );
                
INSERT INTO account1(email,					user_name,				full_name,			department_id, 	position_id, create_date)
VALUES	('A1@gmail.com',	'A1',		'nagoya', 					'5',	'1',	'2021-08-01'),
		('A2@gmail.com',	'A2',		'tokyo',					'4',	'2',	'2021-08-02'),
        ('A3@gmail.com',	'A3',		'osaka',					'3',	'3',	'2021-08-03'),
        ('A4@gmail.com',	'A4',		'kyoto',					'2',	'4',	'2021-08-04'),
        ('A5@gmail.com',	'A5',		'fukuoka',					'1',	'5',	'2021-08-05');
        
INSERT INTO  group1(group_name,			 creator_id,			      create_date)
VALUES		('marketing1',				'1',						'2020-09-01'),
			('sale1',					'2',						'2020-09-10'),
            ('pv',						'3',						'2020-09-11'),
            ('bgd',						'4',						'2020-09-20'),
            ('bv',						'5',						'2020-09-25');
            
INSERT INTO group_account(group_id,			account_id)
VALUES 					(1,					2),
						(2,					3),
                        (3,					4),
                        (4,					5),
                        (5,					6);
                        
INSERT INTO typequestion(typename)
VALUES				('Essay'),
					('Multiple-Choice');
                    
INSERT INTO category_question(category_name)
VALUES 				('java'),
					('net'),
                    ('sql'),
                    ('ruby'),
                    ('python');
                    
INSERT INTO question(content,		category_id,		type_id,		creator_id)
VALUES				(NG,			1,					'2',				'3'),
					(ND,			4,					'2',				'6'),
                    (YN,			3,					'3',				'2'),
                    (KT,			2,					'4',				'1'),
                    (TT,			5,					'1',				'4');
                    
INSERT INTO answer(content,			question_id,		iscorrect)
VALUES			(TL1,				1,					T),
				(TL2,				2,					F),
                (TL3,				3,					F),
                (TL4,				4,					T),
                (TL5,				5,					T);
                
INSERT INTO exam(code_1,		title,		category_id,	duration,		creator_id,	create_date)
VALUES			(MDT01,			DETHIA,		1,				30,				'2',		2021-09-19),
				(MDT02,			DETHIDC,	2,				40,				'3',		2021-09-22),
                (MTD03,			DETHIKT,	4,				35,				'1',		2021-09-23),
                (MTD04,			DETHIQG,	3,				60,				'4',		2021-08-15),
                (MDT05,			DETHITH,	5,				65,				'6',		2021-09-30);
                
INSERT INTO ExamQuestion(Exam_ID,		Question_ID)
VALUES					(1,				5),
						(2,				6),
                        (3,				7),
                        (4,				8),
                        (5,				9);
                        