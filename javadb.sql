--department(학과)
--학과코드(dept_id)-pk, 학과명(dept_name) - 키 빼고 모두 null 허용 안함
-- 'A001', '데이터사이언스'
CREATE TABLE department(
dept_id VARCHAR2(20) PRIMARY KEY,
dept_name VARCHAR2(20) NOT NULL
);
SELECT * FROM DEPARTMENT d;
INSERT INTO DEPARTMENT VALUES('A001', '데이터베이스');
INSERT INTO DEPARTMENT VALUES('A002', '경영학과');
--student(학생)
--학번(student_id), 이름(name), 키(heigh), 학과코드(학과 테이블 참조)
--'20250001', '홍길동', 163.5
CREATE TABLE student(
student_id varchar2(20) PRIMARY KEY,
name varchar2(20) NOT NULL,
height NUMBER(5,2),
dept_id VARCHAR2(20) REFERENCES department(dept_id)
);
ALTER TABLE STUDENT MODIFY heigh NUMBER(5,2);
ALTER TABLE student RENAME COLUMN heigh TO height;

SELECT * FROM STUDENT;
INSERT INTO STUDENT(student_id, name, height, dept_id) VALUES('20250001', '홍길동', 163.5, 'A002');
INSERT INTO STUDENT(student_id, name, dept_id) VALUES('20250002', '성춘향', 'A001');

--professor(교수)
--교수코드(prof_id), 교수명(prof_name), 학과코드(학과 테이블 참조)
--'P001', '김유진'
CREATE TABLE professor(
prof_id varchar2(20) PRIMARY KEY,
prof_name varchar2(20) NOT NULL,
dept_id VARCHAR2(20) REFERENCES department(dept_id)
);
SELECT * FROM PROFESSOR p;
INSERT INTO PROFESSOR(prof_id,PROF_NAME,dept_id) VALUES('P001', '김유진', 'A001');
--subject(과목)
--과목코드(subj_id), 교수코드(교수 테이블 참조),시작일(start_date), 종료일(end_date),과목명(subj_name)
--'S001', '2025-03-01', '2025-06-30', '파이썬'
CREATE TABLE subject(
subj_id varchar2(20) PRIMARY KEY,
prof_id varchar2(20) REFERENCES professor(prof_id),
start_date DATE NOT NULL,
end_date DATE NOT NULL,
subj_name varchar2(20) NOT NULL
);

INSERT INTO SUBJECT VALUES('S001', 'P001', '2025-03-01', '2025-06-30', '파이썬');
SELECT * FROM SUBJECT s;

--enroll(수강)
--수강코드(enroll_id), 학생코드(학생 테이블 참조), 과목코드(과목 테이블 참조), 수강일자(enroll_date)
--1(자동증가), '2025-06-30'
CREATE TABLE enroll(
enroll_id NUMBER(7) PRIMARY KEY,
student_id varchar2(20) REFERENCES STUDENT(student_id),
subj_id varchar2(20) REFERENCES SUBJECT(subj_id),
enroll_date DATE NOT NULL
);

SELECT * FROM enroll;
CREATE SEQUENCE enroll_sequence;
INSERT INTO enroll VALUES(enroll_sequence.nextval, '20250001', 'S001','2025-06-30');










