CREATE TABLE USERTBL(
    NO NUMBER(8) CONSTRAINT PK_USERTBL PRIMARY KEY,
    USERNAME NCHAR(4) NOT NULL,
    BIRTHYEAR NUMBER(4) NOT NULL,
    ADDR NCHAR(4) NOT NULL,
    MOBILE NVARCHAR2(13));

CREATE SEQUENCE USERTBL_SEQ;

INSERT INTO USERTBL
VALUES(USERTBL_SEQ.NEXTVAL,'ȫ�浿',1955,'����','010-1235-4568');
INSERT INTO USERTBL
VALUES(USERTBL_SEQ.NEXTVAL,'������',1965,'�λ�','010-3568-4568');
INSERT INTO USERTBL
VALUES(USERTBL_SEQ.NEXTVAL,'�ս¿�',1975,'�뱸','010-8596-1234');
INSERT INTO USERTBL
VALUES(USERTBL_SEQ.NEXTVAL,'�ŵ���',1985,'��õ','010-7777-8888');
INSERT INTO USERTBL
VALUES(USERTBL_SEQ.NEXTVAL,'�輮ȣ',1995,'�Ȼ�','010-8888-6954');

COMMIT;

SELECT * FROM USERTBL;


select rn, board.bno, title, writer, regdate, updatedate, 
			photo_attach.uuid,photo_attach.uploadPath,
			photo_attach.fileName, photo_attach.fileType		
from(select *
     from (select /*+INDEX_DESC(photo_board pk_photo_board)*/ rownum rn, bno, title, writer, regdate, updatedate
	       from photo_board)
     )board left outer join photo_attach on board.bno = photo_attach.bno where rownum<=(1*9)
where rn> (1-1)*9;	



select *
 from (select /*+INDEX_DESC(photo_board pk_photo_board)*/ rownum rn, bno, title, writer, regdate, updatedate
	       from photo_board)
     board left outer join photo_attach on board.bno = photo_attach.bno where rownum<=(1*9)