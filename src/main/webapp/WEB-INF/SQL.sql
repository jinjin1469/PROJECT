CREATE TABLE members(
memberNum number(6) not null PRIMARY KEY,
memberId varchar2(50) not null UNIQUE,
memberPassword varchar2(100) not null,
memberName varchar2(100) not null,
memberEmail varchar2(200),
memberPhone varchar2(13) not null);

CREATE SEQUENCE members_seq
START WITH 10008
NOCACHE;

INSERT INTO members 
VALUES(10001,'admin','1234','관리자','admin@green.com','010-1234-5678');
INSERT INTO members 
VALUES(10002,'park','1234','박민준','park@green.com','010-1234-5679');
INSERT INTO members 
VALUES(10003,'kim','1234','김서연','kim@green.com','010-1234-5680');
INSERT INTO members 
VALUES(10004,'lee','1234','이서준','lee@green.com','010-1234-5681');
INSERT INTO members 
VALUES(10005,'jung','1234','정서윤','jung@green.com','010-1234-5682');
INSERT INTO members 
VALUES(10006,'choi','1234','최예준','choi@green.com','010-1234-5683');
INSERT INTO members 
VALUES(10007,'jo','1234','조지우','jo@green.com','010-1234-5684');

SELECT * FROM boards;

CREATE TABLE boards(
qnaBoardNum number(6) not null PRIMARY KEY,
memberNum number(6) not null CONSTRAINT BFK REFERENCES members(memberNum),
qnaBoardTitle varchar2(1000) not null,
qnaBoardContent varchar2(4000),
qnaBoardRegdate date DEFAULT SYSDATE,
qnaBoardCount number(10) DEFAULT 0);

CREATE SEQUENCE boards_seq
START WITH 113
NOCACHE;

INSERT INTO boards 
VALUES(101,10002,'질문이 있습니다','프로토콜에는 어떤 것이 있나요?',
'2020-09-15',5);
INSERT INTO boards 
VALUES(102,10003,'DB 질문이 있습니다.','인덱스를 만드는 이유는 무엇인가요?',
'2020-10-13',4);
INSERT INTO boards 
VALUES(103,10007,'스프링에 관련해서 질문이 있습니다.','스프링과 스프링 부트의 차이가 무엇인가요?',
'2020-10-21',6);
INSERT INTO boards 
VALUES(104,10005,'서블릿 궁금한 게 있어요.','어노테이션 없이 매핑을 어떻게 하나요?',
'2020-11-03',3);
INSERT INTO boards 
VALUES(105,10004,'HTML에 궁금한 게 있습니다.','meta태그는 무엇이며 어떤 내용을 담고 있나요?',
'2020-11-16',7);
INSERT INTO boards 
VALUES(106,10003,'DB 관련 질문이 있습니다.','조인과 서브 쿼리는 어떤 경우에 사용하나요?',
'2020-11-27',5);
INSERT INTO boards 
VALUES(107,10004,'CSS가 어려워요','텍스트를 상하 가운데 정렬을 하고 싶은데 어떻게 하나요?',
'2020-12-05',6);
INSERT INTO boards 
VALUES(108,10006,'자바스크립트 질문이요','selectQuery와 getElementById의 차이와 어떤 경우에 사용하는 지 궁금합니다.',
'2020-12-13',4);
INSERT INTO boards 
VALUES(109,10002,'질문이 있습니다.','URL과 URI의 차이는 무엇인가요?',
'2021-01-07',7);
INSERT INTO boards 
VALUES(110,10005,'JSP에서 페이지 이동에 관련해서 질문이 있습니다.','포워드와 리다이렉트의 차이와 어떤 경우에 사용되는지 알려주세요.',
'2021-01-18',3);
INSERT INTO boards 
VALUES(111,10006,'DOM에 관련해서 질문이 있어요','새로 만든 노드를 화면에 만들고 싶은데 어떻게 끼워 넣어야 하나요?',
'2021-02-20',4);
INSERT INTO boards 
VALUES(112,10007,'스프링 어려워요','제어의 역전이 무엇이고 어떻게 사용하는 건가요?',
'2021-03-02',5);


CREATE TABLE Comments(
commentNum number(6) not null PRIMARY KEY,
qnaBoardNum number(6) not null CONSTRAINT CFK REFERENCES boards(qnaBoardNum),
commentContent varchar2(4000) not null,
commentRegdate date DEFAULT SYSDATE
);

CREATE SEQUENCE Comments_seq
START WITH 6
NOCACHE;

INSERT INTO Comments 
VALUES(1,101,'프로토콜에는 HTTP,HTTPS등이 있습니다.','2020-09-16');
INSERT INTO Comments 
VALUES(2,102,'빠른 데이터 검색을 위해서 필요합니다.','2020-10-14');
INSERT INTO Comments 
VALUES(3,105,'meta 태그는 화면에 노출되지 않는 문서의 기본정보를 작성합니다.','2020-11-17');
INSERT INTO Comments 
VALUES(4,104,'web.xml을 이용합니다.','2020-11-17');
INSERT INTO Comments 
VALUES(5,103,'스프링 설정을 보다 간소화 한 것이 스프링 부트입니다.','2020-11-17');

COMMIT;

ALTER TABLE Boards DROP CONSTRAINT BFK;
ALTER TABLE Comments DROP CONSTRAINT CFK;

ALTER TABLE Boards ADD CONSTRAINT BFK FOREIGN KEY(memberNum) REFERENCES members(memberNum) ON DELETE CASCADE;
ALTER TABLE Comments ADD CONSTRAINT CFK FOREIGN KEY(qnaBoardNum) REFERENCES boards(qnaBoardNum) ON DELETE CASCADE;