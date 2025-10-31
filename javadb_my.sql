-- department(학과)
-- 학과코드(dept_id)-pk, 학과명(dept_name) - 키 빼고 모두 null 허용 안함
-- 'A001', '데이터사이언스'

CREATE TABLE department(
dept_id VARCHAR(20) PRIMARY KEY,
dept_name VARCHAR(20) NOT NULL
);

-- student(학생)
-- 학번(student_id), 이름(name), 키(heigh), 학과코드(학과 테이블 참조)
-- '20250001', '홍길동', 163.5
CREATE TABLE student(
student_id char(20) PRIMARY KEY,
name varchar(20) NOT NULL,
heigh decimal(5,2),
dept_id VARCHAR(20),
constraint fk_student_department foreign key(dept_id) REFERENCES department(dept_id)
);

-- professor(교수)
-- 교수코드(prof_id), 교수명(prof_name), 학과코드(학과 테이블 참조)
-- 'P001', '김유진'
CREATE TABLE professor(
prof_id varchar(20) PRIMARY KEY,
prof_name varchar(20) NOT NULL,
dept_id VARCHAR(20),
constraint fk_professor_department foreign key(dept_id) REFERENCES department(dept_id)
);



-- subject(과목)
-- 과목코드(subj_id), 교수코드(교수 테이블 참조),시작일(start_date), 종료일(end_date),과목명(subj_name)
-- 'S001', '2025-03-01', '2025-06-30', '파이썬'
CREATE TABLE subject(
subj_id char(8) PRIMARY KEY,
prof_id varchar(4),
constraint fk_subject_department foreign key(prof_id) REFERENCES professor(prof_id),
start_date DATE NOT NULL,
end_date DATE NOT NULL,
subj_name varchar(100) NOT NULL
);


-- enroll(수강)
-- 수강코드(enroll_id), 학생코드(학생 테이블 참조), 과목코드(과목 테이블 참조), 수강일자(enroll_date)
-- 1(자동증가), '2025-06-30'
CREATE TABLE enroll(
enroll_id int auto_increment PRIMARY KEY,
enroll_date DATE NOT null,
student_id char(20),
subj_id char(20),
constraint fk_enroll_student foreign key(student_id) REFERENCES STUDENT(student_id),
constraint fk_enroll_subj foreign key(subj_id) REFERENCES SUBJECT(subj_id)
);




SELECT * FROM DEPARTMENT d;
INSERT INTO DEPARTMENT VALUES('A001', '데이터베이스');
INSERT INTO DEPARTMENT VALUES('A002', '경영학과');

SELECT * FROM STUDENT;
INSERT INTO STUDENT(student_id, name, heigh, dept_id) VALUES('20250001', '홍길동', 163.5, 'A002');
INSERT INTO STUDENT(student_id, name, dept_id) VALUES('20250002', '성춘향', 'A001');



SELECT * FROM PROFESSOR p;
INSERT INTO PROFESSOR(prof_id,PROF_NAME,dept_id) VALUES('P001', '김유진', 'A001');

SELECT * FROM SUBJECT s;
INSERT INTO SUBJECT VALUES('S001', 'P001', '2025-03-01', '2025-06-30', '파이썬');

SELECT * FROM enroll;
INSERT INTO enroll(student_id,subj_id,enroll_date) VALUES('20250001', 'S001',curdate());
select curdate();
-- mysql 에선 from dual 이 필요하지 않다. 테이블이 없어도 함수실행이 가능하다.

select lower('Do it SQL'), UPPER('Do it SQL');
