
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
   car_status VARCHAR2(10) DEFAULT 'AVAILABLE',
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
    user_exp_date DATE,
    user_return_date DATE,
    car_rent VARCHAR2(5) DEFAULT 'false'
);

CREATE SEQUENCE rent_history_seq
    START WITH 1
    INCREMENT BY 1
    MAXVALUE 10000000
    NOCYCLE
    NOCACHE;


INSERT INTO rent_users VALUES(rent_users_seq.NEXTVAL, '김영철', '01081966248', 48, 'GOLD', '중랑구');
INSERT INTO rent_users VALUES(rent_users_seq.NEXTVAL, '박규언', '01069148246', 47, 'SILVER', '강남구');
INSERT INTO rent_users VALUES(rent_users_seq.NEXTVAL, '유현승', '01026300196', 29, 'SILVER', '강남구');
INSERT INTO rent_users VALUES(rent_users_seq.NEXTVAL, '이서윤', '01053076616', 53, 'GOLD', '강남구');
INSERT INTO rent_users VALUES(rent_users_seq.NEXTVAL, '최혁', '01057898529', 31, 'BRONZE', '관악구');
INSERT INTO rent_users VALUES(rent_users_seq.NEXTVAL, '황신우', '01011393683', 39, 'BRONZE', '중구');
INSERT INTO rent_users VALUES(rent_users_seq.NEXTVAL, '이민경', '01072355299', 32, 'SILVER', '노원구');
INSERT INTO rent_users VALUES(rent_users_seq.NEXTVAL, '이호준', '01041710493', 22, 'BRONZE', '송파구');
INSERT INTO rent_users VALUES(rent_users_seq.NEXTVAL, '최준용', '01084321127', 26, 'BRONZE', '서초구');
INSERT INTO rent_users VALUES(rent_users_seq.NEXTVAL, '최강현', '01011426521', 50, 'BRONZE', '강남구');
INSERT INTO rent_users VALUES(rent_users_seq.NEXTVAL, '권현진', '01010549644', 71, 'GOLD', '강남구');
INSERT INTO rent_users VALUES(rent_users_seq.NEXTVAL, '최빈', '01011423751', 44, 'BRONZE', '동대문구');
INSERT INTO rent_users VALUES(rent_users_seq.NEXTVAL, '문주창', '01035560565', 20, 'BRONZE', '인천');
INSERT INTO rent_users VALUES(rent_users_seq.NEXTVAL, '이창준', '01092546602', 40, 'SILVER', '은평구');
INSERT INTO rent_users VALUES(rent_users_seq.NEXTVAL, '김하영', '01085862865', 29, 'VIP', '송파구');
INSERT INTO rent_users VALUES(rent_users_seq.NEXTVAL, '심민재', '01074024565', 53, 'SILVER', '마포구');
INSERT INTO rent_users VALUES(rent_users_seq.NEXTVAL, '김동준', '01065976690', 67, 'BRONZE', '노원구');
INSERT INTO rent_users VALUES(rent_users_seq.NEXTVAL, '유현지', '01054977969', 39, 'GOLD', '마포구');
INSERT INTO rent_users VALUES(rent_users_seq.NEXTVAL, '하지원', '01010486305', 22, 'BRONZE', '마포구');
INSERT INTO rent_users VALUES(rent_users_seq.NEXTVAL, '김나래', '01095290245', 52, 'GOLD', '도봉구');

INSERT INTO CARS VALUES(cars_seq.NEXTVAL,'S1','SPARK','COMPACT',105000,'B','ONRENT',1);
INSERT INTO CARS VALUES(cars_seq.NEXTVAL,'S2','SPARK','COMPACT',105000,'A','ONRENT',13);
INSERT INTO CARS VALUES(cars_seq.NEXTVAL,'M1','MORNING','COMPACT',105000,'C','AVAILABLE',NULL);
INSERT INTO CARS VALUES(cars_seq.NEXTVAL,'M2','MORNING','COMPACT',105000,'B','ONRENT',4);
INSERT INTO CARS VALUES(cars_seq.NEXTVAL,'R1','RAY','COMPACT',110000,'A','ONRENT',20);
INSERT INTO CARS VALUES(cars_seq.NEXTVAL,'R2','RAY','COMPACT',110000,'B','ONRENT',18);
INSERT INTO CARS VALUES(cars_seq.NEXTVAL,'K31','K3','SMALL',120000,'A','ONRENT',10);
INSERT INTO CARS VALUES(cars_seq.NEXTVAL,'K32','K3','SMALL',120000,'C','ONRENT',6);
INSERT INTO CARS VALUES(cars_seq.NEXTVAL,'K33','K3','SMALL',120000,'B','ONRENT',3);
INSERT INTO CARS VALUES(cars_seq.NEXTVAL,'SM31','SM3','SMALL',120000,'A','ONRENT',12);
INSERT INTO CARS VALUES(cars_seq.NEXTVAL,'SM32','SM3','SMALL',120000,'C','ONRENT',14);
INSERT INTO CARS VALUES(cars_seq.NEXTVAL,'I301','I30','SMALL',132000,'A','ONRENT',14);
INSERT INTO CARS VALUES(cars_seq.NEXTVAL,'I302','I30','SMALL',132000,'B','ONRENT',9);
INSERT INTO CARS VALUES(cars_seq.NEXTVAL,'A1','AVANTE','SMALL',132001,'S','ONRENT',1);
INSERT INTO CARS VALUES(cars_seq.NEXTVAL,'A2','AVANTE','SMALL',132000,'B','ONRENT',15);
INSERT INTO CARS VALUES(cars_seq.NEXTVAL,'SONA1','SONATA','MIDSIZE',187000,'B','AVAILABLE',NULL);
INSERT INTO CARS VALUES(cars_seq.NEXTVAL,'SONA2','SONATA','MIDSIZE',187000,'A','AVAILABLE',NULL);
INSERT INTO CARS VALUES(cars_seq.NEXTVAL,'S61','SM6','MIDSIZE',193000,'C','ONRENT',2);
INSERT INTO CARS VALUES(cars_seq.NEXTVAL,'S62','SM6','MIDSIZE',193000,'B','ONRENT',7);
INSERT INTO CARS VALUES(cars_seq.NEXTVAL,'K51','K5','MIDSIZE',193000,'S','ONRENT',11);
INSERT INTO CARS VALUES(cars_seq.NEXTVAL,'K52','K5','MIDSIZE',193000,'B','ONRENT',19);
INSERT INTO CARS VALUES(cars_seq.NEXTVAL,'G1','GRANDEUR','BIG',439000,'A','ONRENT',5);
INSERT INTO CARS VALUES(cars_seq.NEXTVAL,'G801','G80','BIG',492000,'A','REPAIR',NULL);
INSERT INTO CARS VALUES(cars_seq.NEXTVAL,'ST1','STAREX','VAN',242000,'A','AVAILABLE',NULL);
INSERT INTO CARS VALUES(cars_seq.NEXTVAL,'ST2','STAREX','VAN',242000,'C','ONRENT',17);
INSERT INTO CARS VALUES(cars_seq.NEXTVAL,'Q1','QM6','SUV',270000,'B','ONRENT',11);
INSERT INTO CARS VALUES(cars_seq.NEXTVAL,'Q2','QM6','SUV',270000,'A','AVAILABLE',NULL);
INSERT INTO CARS VALUES(cars_seq.NEXTVAL,'M1','MINI','FOREIGN',385000,'A','AVAILABLE',NULL);
INSERT INTO CARS VALUES(cars_seq.NEXTVAL,'M2','MINI','FOREIGN',385000,'C','REPAIR',NULL);
INSERT INTO CARS VALUES(cars_seq.NEXTVAL,'A81','A8','FOREIGN',791000,'B','ONRENT',15);

INSERT INTO rent_history VALUES(rent_history_seq.NEXTVAL, 12,10, '21/12/31','21/05/06',null,'false');
INSERT INTO rent_history VALUES(rent_history_seq.NEXTVAL, 8,3, '22/01/15','22/01/31','22/01/31','TRUE');
INSERT INTO rent_history VALUES(rent_history_seq.NEXTVAL, 3,9, '22/02/05','23/07/21',null,'false');
INSERT INTO rent_history VALUES(rent_history_seq.NEXTVAL, 6,8, '22/03/01','23/05/16',null,'false');
INSERT INTO rent_history VALUES(rent_history_seq.NEXTVAL, 5,22, '22/04/12','23/05/17',null,'false');
INSERT INTO rent_history VALUES(rent_history_seq.NEXTVAL, 8,16, '22/04/13','22/04/13','22/04/15','TRUE');
INSERT INTO rent_history VALUES(rent_history_seq.NEXTVAL, 7,19, '22/05/03','23/05/19',null,'false');
INSERT INTO rent_history VALUES(rent_history_seq.NEXTVAL, 9,13, '22/05/13','23/06/20',null,'false');
INSERT INTO rent_history VALUES(rent_history_seq.NEXTVAL, 17,25, '22/06/27','23/07/21',null,'false');
INSERT INTO rent_history VALUES(rent_history_seq.NEXTVAL, 12,17, '22/06/28','22/07/07','22/07/07','TRUE');
INSERT INTO rent_history VALUES(rent_history_seq.NEXTVAL, 18,6, '22/09/03','23/05/23',null,'false');
INSERT INTO rent_history VALUES(rent_history_seq.NEXTVAL, 13,2, '22/09/29','23/10/24',null,'false');
INSERT INTO rent_history VALUES(rent_history_seq.NEXTVAL, 10,7, '22/11/18','23/06/25',null,'false');
INSERT INTO rent_history VALUES(rent_history_seq.NEXTVAL, 14,23, '22/11/20','22/12/04','22/12/01','TRUE');
INSERT INTO rent_history VALUES(rent_history_seq.NEXTVAL, 19,21, '22/12/07','23/05/01',null,'false');
INSERT INTO rent_history VALUES(rent_history_seq.NEXTVAL, 15,30, '22/12/26','23/08/03',null,'false');
INSERT INTO rent_history VALUES(rent_history_seq.NEXTVAL, 11,20, '23/01/01','23/05/15',null,'false');
INSERT INTO rent_history VALUES(rent_history_seq.NEXTVAL, 11,26, '23/01/01','23/10/26',null,'false');
INSERT INTO rent_history VALUES(rent_history_seq.NEXTVAL, 2,18, '23/01/03','23/12/31',null,'false');
INSERT INTO rent_history VALUES(rent_history_seq.NEXTVAL, 4,4, '23/01/05','23/11/17',null,'false');
INSERT INTO rent_history VALUES(rent_history_seq.NEXTVAL, 16,15, '23/02/02','23/09/09',null,'false');
INSERT INTO rent_history VALUES(rent_history_seq.NEXTVAL, 1,1, '23/04/12','23/05/13',null,'false');
INSERT INTO rent_history VALUES(rent_history_seq.NEXTVAL, 1,14, '23/04/12','23/05/12',null,'false');
INSERT INTO rent_history VALUES(rent_history_seq.NEXTVAL, 20,5, '23/05/04','23/07/31',null,'false');
INSERT INTO rent_history VALUES(rent_history_seq.NEXTVAL, 14,11, '23/11/03','23/05/29',null,'false');
INSERT INTO rent_history VALUES(rent_history_seq.NEXTVAL, 14,12, '23/11/03','23/05/07',null,'false');

COMMIT;


-- 리셋용 드랍
DROP TABLE rent_history;
DROP SEQUENCE rent_history_seq;
DROP TABLE cars;
DROP SEQUENCE cars_seq;
DROP TABLE rent_users;
DROP SEQUENCE rent_users_seq;
