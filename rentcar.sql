
CREATE TABLE rent_users(
    user_num NUMBER(5) CONSTRAINT user_pk PRIMARY KEY,
    user_name VARCHAR2(20) NOT NULL,
    phone_number VARCHAR2(30) NOT NULL,
    user_age NUMBER(3) NOT NULL,
    user_grade VARCHAR2(10) DEFAULT 'BRONZE',
    user_location VARCHAR2(20) NOT NULL
);

CREATE SEQUENCE rent_users_seq
    START WITH 1
    INCREMENT BY 1
    MAXVALUE 100000
    NOCYCLE
    NOCACHE;

CREATE TABLE cars(
   car_num NUMBER(5) CONSTRAINT car_pk PRIMARY KEY,
   car_id VARCHAR2(20) NOT NULL,
   car_model VARCHAR2(50) NOT NULL,
   car_size VARCHAR2(20) NOT NULL,
   car_fee NUMBER(7) NOT NULL,
   car_grade VARCHAR2(1) NOT NULL,
   car_status VARCHAR2(10) DEFAULT 'available',
   user_num NUMBER(5) CONSTRAINT car_user_fk REFERENCES rent_users(user_num)
);

CREATE SEQUENCE cars_seq
    START WITH 1
    INCREMENT BY 1
    MAXVALUE 100000
    NOCYCLE
    NOCACHE;

CREATE TABLE rent_history(
    rent_num NUMBER(7) CONSTRAINT rent_pk PRIMARY KEY,
    user_num NUMBER(5) CONSTRAINT rent_user_fk REFERENCES rent_users(user_num),
    car_num NUMBER(5) CONSTRAINT rent_car_fk REFERENCES cars(car_num),
    user_rent_date DATE DEFAULT sysdate,
    user_return_date DATE,
    car_rent VARCHAR2(5) DEFAULT 'false'
);

CREATE SEQUENCE rent_history_seq
    START WITH 1
    INCREMENT BY 1
    MAXVALUE 10000000
    NOCYCLE
    NOCACHE;



INSERT INTO rent_users VALUES(rent_users_seq.NEXTVAL, '�迵ö', '01081966248', 48, 'GOLD', '�߶���');
INSERT INTO rent_users VALUES(rent_users_seq.NEXTVAL, '�ڱԾ�', '01069148246', 47, 'SILVER', '������');
INSERT INTO rent_users VALUES(rent_users_seq.NEXTVAL, '������', '01026300196', 29, 'SILVER', '������');
INSERT INTO rent_users VALUES(rent_users_seq.NEXTVAL, '�̼���', '01053076616', 53, 'GOLD', '������');
INSERT INTO rent_users VALUES(rent_users_seq.NEXTVAL, '����', '01057898529', 31, 'BRONZE', '���Ǳ�');
INSERT INTO rent_users VALUES(rent_users_seq.NEXTVAL, 'Ȳ�ſ�', '01011393683', 39, 'BRONZE', '�߱�');
INSERT INTO rent_users VALUES(rent_users_seq.NEXTVAL, '�̹ΰ�', '01072355299', 32, 'SILVER', '�����');
INSERT INTO rent_users VALUES(rent_users_seq.NEXTVAL, '��ȣ��', '01041710493', 22, 'BRONZE', '���ı�');
INSERT INTO rent_users VALUES(rent_users_seq.NEXTVAL, '���ؿ�', '01084321127', 26, 'BRONZE', '���ʱ�');
INSERT INTO rent_users VALUES(rent_users_seq.NEXTVAL, '�ְ���', '01011426521', 50, 'BRONZE', '������');
INSERT INTO rent_users VALUES(rent_users_seq.NEXTVAL, '������', '01010549644', 71, 'GOLD', '������');
INSERT INTO rent_users VALUES(rent_users_seq.NEXTVAL, '�ֺ�', '01011423751', 44, 'BRONZE', '���빮��');
INSERT INTO rent_users VALUES(rent_users_seq.NEXTVAL, '����â', '01035560565', 20, 'BRONZE', '��õ');
INSERT INTO rent_users VALUES(rent_users_seq.NEXTVAL, '��â��', '01092546602', 40, 'SILVER', '����');
INSERT INTO rent_users VALUES(rent_users_seq.NEXTVAL, '���Ͽ�', '01085862865', 29, 'VIP', '���ı�');
INSERT INTO rent_users VALUES(rent_users_seq.NEXTVAL, '�ɹ���', '01074024565', 53, 'SILVER', '������');
INSERT INTO rent_users VALUES(rent_users_seq.NEXTVAL, '�赿��', '01065976690', 67, 'BRONZE', '�����');
INSERT INTO rent_users VALUES(rent_users_seq.NEXTVAL, '������', '01054977969', 39, 'GOLD', '������');
INSERT INTO rent_users VALUES(rent_users_seq.NEXTVAL, '������', '01010486305', 22, 'BRONZE', '������');
INSERT INTO rent_users VALUES(rent_users_seq.NEXTVAL, '�質��', '01095290245', 52, 'GOLD', '������');

INSERT INTO CARS VALUES(1,'S1','SPARK','COMPACT',105000,'B','ONRENT',1);
INSERT INTO CARS VALUES(14,'A1','AVANTE','SMALL',132001,'S','ONRENT',1);
INSERT INTO CARS VALUES(18,'S61','SM6','MIDSIZE',193000,'C','ONRENT',2);
INSERT INTO CARS VALUES(9,'K33','K3','SMALL',120000,'B','ONRENT',3);
INSERT INTO CARS VALUES(4,'M2','MORNING','COMPACT',105000,'B','ONRENT',4);
INSERT INTO CARS VALUES(22,'G1','GRANDEUR','BIG',439000,'A','ONRENT',5);
INSERT INTO CARS VALUES(8,'K32','K3','SMALL',120000,'C','ONRENT',6);
INSERT INTO CARS VALUES(10,'SM31','SM3','SMALL',120000,'A','ONRENT',12);
INSERT INTO CARS VALUES(3,'M1','MORNING','COMPACT',105000,'C','AVAILABLE',Null);

INSERT INTO rent_history(rent_num, user_num, car_num,user_rent_date) VALUES(rent_history_seq.NEXTVAL, 12,10, '21/12/31');
INSERT INTO rent_history(rent_num, user_num,car_num,user_rent_date,user_return_date,car_rent) VALUES(rent_history_seq.NEXTVAL,8,3,'22/01/15','22/01/31','TRUE');
INSERT INTO rent_history(rent_num, user_num, car_num,user_rent_date) VALUES(rent_history_seq.NEXTVAL, 3,9, '22/02/05');



-- ���¿� ���
DROP TABLE rent_history;
DROP SEQUENCE rent_history_seq;
DROP TABLE cars;
DROP SEQUENCE cars_seq;
DROP TABLE rent_users;
DROP SEQUENCE rent_users_seq;
