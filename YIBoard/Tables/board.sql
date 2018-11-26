create table users(
	id varchar(8) primary key,
	password varchar(8),
	name varchar(20),
	role int
	);
	
create table board(
	seq int primary key,
	title varchar(200),
	writer_id varchar(8),
	content varchar(2000),
	regdate date default sysdate,
	cnt int default 0
	);
	
insert into users values('admin','1234','관리자',0);
insert into users values('user1','1234','사용자1',9);
insert into users values('user2','1234','사용자2',9);
insert into users values('user3','1234','사용자3',9);

insert into board(seq,title,writer_id,content)
values(1,'가입인사','user1','zzzz');
insert into board(seq,title,writer_id,content)
values(2,'안녕하세요','admin','qwer');